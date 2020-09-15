UMovieSceneSequencePlayer = {} ---@type UObject
UMovieSceneSequencePlayer.OnPlay = nil
UMovieSceneSequencePlayer.OnPlayReverse = nil
UMovieSceneSequencePlayer.OnStop = nil
UMovieSceneSequencePlayer.OnPause = nil
UMovieSceneSequencePlayer.OnFinished = nil
UMovieSceneSequencePlayer.Status = nil
UMovieSceneSequencePlayer.bReversePlayback = nil
UMovieSceneSequencePlayer.Sequence = nil
UMovieSceneSequencePlayer.StartTime = nil
UMovieSceneSequencePlayer.DurationFrames = nil
UMovieSceneSequencePlayer.CurrentNumLoops = nil
UMovieSceneSequencePlayer.PlaybackSettings = nil
UMovieSceneSequencePlayer.RootTemplateInstance = nil
UMovieSceneSequencePlayer.NetSyncProps = nil
UMovieSceneSequencePlayer.PlaybackClient = nil
function UMovieSceneSequencePlayer.Play() end
function UMovieSceneSequencePlayer.PlayReverse() end
function UMovieSceneSequencePlayer.ChangePlaybackDirection() end
function UMovieSceneSequencePlayer.PlayLooping() end
function UMovieSceneSequencePlayer.Pause() end
function UMovieSceneSequencePlayer.Scrub() end
function UMovieSceneSequencePlayer.Stop() end
function UMovieSceneSequencePlayer.StopAtCurrentTime() end
function UMovieSceneSequencePlayer.GoToEndAndStop() end
function UMovieSceneSequencePlayer.GetPlaybackPosition() end
function UMovieSceneSequencePlayer.GetLength() end
function UMovieSceneSequencePlayer.GetPlaybackStart() end
function UMovieSceneSequencePlayer.GetPlaybackEnd() end
function UMovieSceneSequencePlayer.SetPlaybackPosition(NewPlaybackPosition) end
function UMovieSceneSequencePlayer.SetPlaybackRange(NewStartTime, NewEndTime) end
function UMovieSceneSequencePlayer.JumpToPosition(NewPlaybackPosition) end
function UMovieSceneSequencePlayer.GetCurrentTime() end
function UMovieSceneSequencePlayer.GetDuration() end
function UMovieSceneSequencePlayer.GetFrameDuration() end
function UMovieSceneSequencePlayer.GetFrameRate() end
function UMovieSceneSequencePlayer.SetFrameRate(FrameRate) end
function UMovieSceneSequencePlayer.GetStartTime() end
function UMovieSceneSequencePlayer.GetEndTime() end
function UMovieSceneSequencePlayer.SetFrameRange(StartFrame, Duration) end
function UMovieSceneSequencePlayer.SetTimeRange(StartTime, Duration) end
function UMovieSceneSequencePlayer.PlayToFrame(NewPosition) end
function UMovieSceneSequencePlayer.ScrubToFrame(NewPosition) end
function UMovieSceneSequencePlayer.JumpToFrame(NewPosition) end
function UMovieSceneSequencePlayer.PlayToSeconds(TimeInSeconds) end
function UMovieSceneSequencePlayer.ScrubToSeconds(TimeInSeconds) end
function UMovieSceneSequencePlayer.JumpToSeconds(TimeInSeconds) end
function UMovieSceneSequencePlayer.PlayToMarkedFrame(InLabel) end
function UMovieSceneSequencePlayer.ScrubToMarkedFrame(InLabel) end
function UMovieSceneSequencePlayer.JumpToMarkedFrame(InLabel) end
function UMovieSceneSequencePlayer.IsPlaying() end
function UMovieSceneSequencePlayer.IsPaused() end
function UMovieSceneSequencePlayer.IsReversed() end
function UMovieSceneSequencePlayer.GetPlayRate() end
function UMovieSceneSequencePlayer.SetPlayRate(PlayRate) end
function UMovieSceneSequencePlayer.SetDisableCameraCuts(bInDisableCameraCuts) end
function UMovieSceneSequencePlayer.GetDisableCameraCuts() end
function UMovieSceneSequencePlayer.GetBoundObjects(ObjectBinding) end
function UMovieSceneSequencePlayer.GetObjectBindings(InObject) end
function UMovieSceneSequencePlayer.RPC_ExplicitServerUpdateEvent(Method, RelevantTime) end
function UMovieSceneSequencePlayer.RPC_OnStopEvent(StoppedTime) end