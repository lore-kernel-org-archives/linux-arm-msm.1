Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF5C36826B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546950; cv=none; b=NyC1r/20MYIcVqF3bDGDJBZWAe0mH1m6v+2oFnPfWKWK2oWvq9zi7HDMGM7EzS6ixmLPDdtsOfAh17t+CJxUwhy1F+46VPpJJAQcFr102I9dtsMI10pVI83aoYM/OI9ZSKrGmB3WxmkMqjYlY6siW9LHWNOHsORGbxEywy0+p2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546950; c=relaxed/simple;
	bh=Nv7JNeANi6KKj2qm4AhKkXZzIvuelMCxdlm5YCbr3wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAS4BEZRCt6I5eQVTGxWMmHHmmiHv6/viZIc0U8lFBDFqAAmPOWPp+HPMu/JuSIw3wxYCzqUU6xPCN6Ta90FTci142PUUhSlOuZQXVXHpRBs2Ghi/GJ9Ui/pXgtWdEG6Hl7iqeWXRtxrulXzJkd38As/vO//1M5CnivloPidUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QSDBBBx0; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QSDBBBx0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=K5kqgxhX01awbVWi1803hLkxKlTKDjLrNRqbuRxSU0w=; b=QSDBBBx0OZ099E0xiIkqdYCy2H
	/ZlxrBh1xZYNWPtnGpNwQtO7XIA6A+roP99g9MrOOHOpGqdzUAS0n1kV5enSF+x9ngfFazs7tb1yz
	8Fx++4F0Uh58MxCISJ5PbotSQBi3rTnRddMhvLQC9x5xNy3w8hVIUdnbV9yx2xzsMo6R2yYt9CBQ5
	kA8RPfJNEBaJDTgUBYUTbsNWVsMYtv4tseo/g2P1MakogHwlBUoXvuBrhikIkFdH4iXi8pUD56uNB
	5XqwXE58YtbyPTx4M61LLyBQpV9acerFzaS7yotm+QNQJ5SMIyK6LosfKtAjKxHU9Cj+AwWN5TDWn
	k7/c/ygw==;
Received: from 100.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.100] helo=[192.168.1.202])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wlmAo-0011ww-JV; Mon, 20 Jul 2026 13:28:38 +0200
Message-ID: <2b327712-5cd7-400b-bf3d-31b49377154c@igalia.com>
Date: Mon, 20 Jul 2026 13:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/amd/display: don't check colorop status if its
 in an inactive pipeline
To: John Harrison <John.Harrison@Igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, contact@emersion.fr, daniels@collabora.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Sashiko <sashiko-bot@kernel.org>, dri-devel@lists.freedesktop.org
References: <20260609121230.1358786-1-mwen@igalia.com>
 <20260609121230.1358786-4-mwen@igalia.com>
 <3691d76a-4a9c-41ea-ba3b-de08d6c90260@Igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <3691d76a-4a9c-41ea-ba3b-de08d6c90260@Igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/06/2026 00:52, John Harrison wrote:
> On 6/9/26 13:51, Melissa Wen wrote:
>> If colorop BYPASS property is true, but the colorop isn't part of an
> Should this say 'is false'?

Oops, you are right. I'll fix it in the next version.

>
> John.
>
>> active/transient active color pipeline, this colorop status should not
>> be taken into account when checking if a plane color pipeline is
>> actually active. For example, if the userspace doesn't explicitly set a
>> colorop obj to bypass but deactivates its color pipeline by setting
>> plane COLOR_PIPELINE to bypass, it means that colorop is inactive
>> regardless of its BYPASS property status.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Fixes: d3a549f4df78 ("drm/amd/display: Use overlay cursor when color 
>> pipeline is active")
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 31 +++++++++++++------
>>   1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index ba7f98a87808..2edec3e1b838 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -12590,9 +12590,9 @@ static int add_affected_mst_dsc_crtcs(struct 
>> drm_atomic_commit *state, struct dr
>>    * @use_old: if true, inspect the old colorop states; otherwise the 
>> new ones
>>    *
>>    * A color pipeline may be selected (color_pipeline != NULL) but 
>> still is
>> - * inactive if every colorop in the chain is bypassed.  Only return
>> - * true when at least one colorop has bypass == false, meaning the 
>> cursor
>> - * would be subjected to the transformation in native mode.
>> + * inactive if every colorop in the chain is bypassed. Only return 
>> true when at
>> + * least one active colorop has bypass == false, meaning the cursor 
>> would be
>> + * subjected to the transformation in native mode.
>>    *
>>    * Return: true if the pipeline modifies pixels, false otherwise.
>>    */
>> @@ -12600,18 +12600,29 @@ static bool 
>> dm_plane_color_pipeline_active(struct drm_atomic_commit *state,
>>                          struct drm_plane *plane,
>>                          bool use_old)
>>   {
>> -    struct drm_colorop *colorop;
>> -    struct drm_colorop_state *old_colorop_state, *new_colorop_state;
>> -    int i;
>> +    struct drm_plane_state *plane_state = use_old ?
>> +                          drm_atomic_get_old_plane_state(state, 
>> plane) :
>> +                          drm_atomic_get_new_plane_state(state, plane);
>> +    struct drm_colorop *colorop, *pipeline;
>> +    struct drm_colorop_state *cstate;
>>   -    for_each_oldnew_colorop_in_state(state, colorop, 
>> old_colorop_state, new_colorop_state, i) {
>> -        struct drm_colorop_state *cstate = use_old ? 
>> old_colorop_state : new_colorop_state;
>> +    pipeline = plane_state ? plane_state->color_pipeline :
>> +                 plane->state->color_pipeline;
> Why would plane_state be null? And if it is, why is it correct to use 
> plane->state rather than the old or new state as requested by the 
> use_old flag? Seems like there should be a comment to explain this.

Right, about the plane_state, it was a defensive approach for the case 
that we have a colorop change but no changes on plane that make its 
state part of an atomic commit and in this case, there is no difference 
between old/new state, it's just the committed state.
However following the callers of this function, currently plane_state is 
never NULL, so now I think a WARN_ON is enough, instead of handling an 
unreachable case.
>
>
>>   -        if (cstate->colorop->plane != plane)
>> -            continue;
>> +    if (!pipeline)
>> +        return false;
>> +
>> +    drm_for_each_colorop_in_pipeline(colorop, pipeline) {
>> +        cstate = use_old ?
>> +             drm_atomic_get_old_colorop_state(state, colorop) :
>> +             drm_atomic_get_new_colorop_state(state, colorop);
>> +
>> +        if (!cstate)
>> +            cstate = colorop->state;
> Same question as above. Why would there not be a old/new state and if 
> there isn't, why is it correct to use the current state when a check 
> against the old/new state was explicitly requested?

Here is a bit different, there is a situation in which just one or two 
colorops of a given color pipeline changes, but others are not touched. 
In this case only colorops that changed will have a old/new states, but 
others only have the committed state for validation.
To state that a given color pipeline can modify pixels or not, we also 
need to check the commited/current state of all colorop in the selected 
colorop pipeline, not only those that were changed in this atomic commit.
I'll add a comment explaining it better.

Thanks,

Melissa

>
> John.
>
>>           if (!cstate->bypass)
>>               return true;
>>       }
>> +
>>       return false;
>>   }
>

