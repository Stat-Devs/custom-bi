import { Visual } from "../../src/visual";
import powerbiVisualsApi from "powerbi-visuals-api";
import IVisualPlugin = powerbiVisualsApi.visuals.plugins.IVisualPlugin;
import VisualConstructorOptions = powerbiVisualsApi.extensibility.visual.VisualConstructorOptions;
import DialogConstructorOptions = powerbiVisualsApi.extensibility.visual.DialogConstructorOptions;
var powerbiKey: any = "powerbi";
var powerbi: any = window[powerbiKey];
var rvisual2ndattemptED513226B9164958BE7296448CAD6FB7_DEBUG: IVisualPlugin = {
    name: 'rvisual2ndattemptED513226B9164958BE7296448CAD6FB7_DEBUG',
    displayName: 'Rvisual_2nd_attempt',
    class: 'Visual',
    apiVersion: '5.1.0',
    create: (options: VisualConstructorOptions) => {
        if (Visual) {
            return new Visual(options);
        }
        throw 'Visual instance not found';
    },
    createModalDialog: (dialogId: string, options: DialogConstructorOptions, initialState: object) => {
        const dialogRegistry = globalThis.dialogRegistry;
        if (dialogId in dialogRegistry) {
            new dialogRegistry[dialogId](options, initialState);
        }
    },
    custom: true
};
if (typeof powerbi !== "undefined") {
    powerbi.visuals = powerbi.visuals || {};
    powerbi.visuals.plugins = powerbi.visuals.plugins || {};
    powerbi.visuals.plugins["rvisual2ndattemptED513226B9164958BE7296448CAD6FB7_DEBUG"] = rvisual2ndattemptED513226B9164958BE7296448CAD6FB7_DEBUG;
}
export default rvisual2ndattemptED513226B9164958BE7296448CAD6FB7_DEBUG;