Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056521;
	b=p2pNxfr7Hl7+2iKMq9eCkQFw9haxplNG5FiZ29yhfcjPUwKpyK+JAc7tVbwRkYUAsTKG
	 +2jhyJ0fPNZg2RVKjTawrWSzkRRbXL8LTcepCVKrkUua3eSdOtypYUxa0Z8tcF5WLG1Yg
	 JjpblQFAZDcMAa+JiMF8RpyYfboDpIKiiHq/3cjj6zJ6IPVLn6/KKbGI1X3i+ynEhZWm3
	 nw5CW2S9zR6VPGcFNoEQ80RJaz0F0yFiErLY13mufkVOzb98s4ywI9pzsLYZM+0uV5hkm
	 oOeH4k9vmY4uy9Oe4J5sOHoB9k1Gr+H1jFHTP+i8r9q44bSte+MSLoyIHrCY41XW2bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056521;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+DHdAyNizA7TjiMqewTGxuz3iGliKiTpW9uFJ0Zu3bk=;
	b=hSDLZB5emmLohdBaFx01LQZ4rucAyn6u3W8rh6ANEnw9O5Dz77YvqxxXM4znjEiP+ZCx
	 j1V2EuvMKe2pIDw1MlN79D1iCs9tV8y/YOxuzC156XoSGdJIgDNZ2pmK5vigCDqE6xuId
	 Fitf5qvfR25zArjZHPPTgWS9iZKcBh5gw+gpCyZK57HBiOMlU0a8xT3AJkJMu2LgOyQEv
	 +HO1lMuqEOnQM5D1WYn+QJHTISAgNHBd4jZL5qW3UVMbaNwkAPMpAthvqYBCLc9y8nwpl
	 0qg9a31huU9WrxtnQli+6Xl9fyHPnSLQ7LZhyLiLENGWaZ5zp45P05klm9pmwi+wF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=OKUu4Ltc;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F62606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F62606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=OKUu4Ltc
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5+C9eGmNHsPXaGlsuMgVqJCe2uE/aRlsxhqFVlOWH7I=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793056518; v=1; x=1793661318;
 b=OKUu4LtckR0cWT/Bn31ZSz+TBGR1tq3ZHdKApaCXsW+kXDiThS+o186lcjo41LgYLS+lNNx6
 jL05rxBYPJwyDN0iOTfgeR+FBIbjurGt0h8nji04a61710e8L1ol05A9QkoMkfW1lr5ob0tnxBD
 SP2ZSyAFR0xHvHgdPo1Ja0VoIfTCAYXrnDKR4nn30Lftc1U+Q8LmeIIRmABzGj90Q0DSH8ItG4R
 Ph73dtdYXnU15eJCjbrXYgc5U81+5VzuGOQDhYATlo0UGKMymxeZzPM6zsMcR8uNsij+pXtBDbi
 K4/bRyNnMYqSdT7t52F0eCzRxG1k3ShlWRLtTb8ltbntQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05c349e6dd1b2b4b;
	Mon, 26 Oct 2026 23:15:15 +0000
X-Mizu-Trace-ID: 05c349e6dd1b2b4b
X-Migadu-Flow: FLOW_OUT
Message-ID: <cb719558-3f7e-4332-beff-b81fa31cb73d@packett.cool>
Date: Mon, 26 Oct 2026 20:15:10 -0300
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/msm: force mode_changed on color_mgmt_changed,
 not just ctm
To: Xi Zhang <xz.ca.cn@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
 <20261026-msm-dpu-res-clean-v2-5-3d864435186e@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261026-msm-dpu-res-clean-v2-5-3d864435186e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 5:25 PM, Xi Zhang wrote:
> dpu_crtc_atomic_check calls dpu_crtc_assign_resources when
> color_mgmt_changed is set, which is unsafe outside of full modeset.
>
> Set allow_modeset and mode_changed when color_mgmt_changed is set,
> not just when ctm is changed.
>
> Also would fix
> commit 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
> which was reverted.
>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/work_items/102
>
> Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index a8babf1dbe0d..6f0f30b0728a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -195,8 +195,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
>   	 */
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
>   				      new_crtc_state, i) {
> -		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
> -		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
> +		if (new_crtc_state->color_mgmt_changed) {
>   			new_crtc_state->mode_changed = true;
>   			state->allow_modeset = true;
>   		}

This is also handled by patch 9 "drm/msm/dpu: only reassign resources 
when the encoder is reprogrammed" of the smmu fault series:

https://lore.kernel.org/all/20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com/


Thanks,
~val

