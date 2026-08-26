Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A53BB68F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735845; cv=none; b=ivMzgv7bJ/kpgcRSbLH4e0Cj7loavQWZKRJEokzCxjGY5rGs3W/K7bmm1joOz5E7eve71x2O94PWbA+5TZuU35Db3IskDjIgT/IF4uMCWVP1eJ4ZppbmJ98kt5w6l5mcfXhzl4xHnWkoldUmMOZ7dVlziPvdHVNTfoHw8CTuLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735845; c=relaxed/simple;
	bh=+4SrC5NKnJ2rnNB1CB/8LVbaPHOtTcPvIIKmFk4h/tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlGh07ehldrQVfCJnT6doDzRPMDt7qGArZQFdXYMAQO1so5B4G7gyfoC9vIcd3gsleB/gdOdnpsPJnsI9tocBvYwvY97d+aq55l4R0XBawMgCMfdh8Mjm14snBwKk7yaSBpBxTf/udISgKKh0ppntIZk52wWkRDplM9boUh1yEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOp2Nck4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPx2PCMo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOp2Nck4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPx2PCMo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CdJT4065768
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qx8Hit1v4ESGkplelGk4y1PT1ozgsKOulMxfjB8JQNw=; b=JOp2Nck4iQLAaAAk
	LJpEG1l+Ec9KDRsv2HEJZM3EkFgfk80VDBvhdSQ2/cQMLGIInI7MEEnb7mrYnpYm
	Ka8oXe7WyRLucnA/fErWICatTTfvTePvzksCSd094h47SD0VSoEG2DzfI1GIC1K1
	gJIgVmM8HM/ZHC0s2wi4WCUQ6kDryHtApNLn6LcHLTOt6Pri+Awuiq8WQjrnQhUC
	/D0o3BJ9UqWruVeAc5Yvqkzu3TTGzELTt2Cj8tz0nhAXbzVrrRKHOs6aDKUl7rPu
	cUa1g4Dw/HBPmrJypb8uYbIXHlL+BVxt1gIphCWi5+ve7u1vaqrEpMo33dSsWLv6
	XJJ4BA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn34nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:17:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1888160a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735842; x=1788340642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qx8Hit1v4ESGkplelGk4y1PT1ozgsKOulMxfjB8JQNw=;
        b=MPx2PCMoFl13VI+6VYtbVmTze1/OaMGdD0ghSlkAIIsd/DQ1LEkWjI1zbow9RSh0nX
         gUDfk6BAZ1OEcBtIz1IlJGStxozgZW0Q+08+40QKXRYkAGXhpbQ+GyCu4shUm9bNOXz6
         Vth9TNLJSZWZFFi2sSbxAl8D9pKb0NT6wyW44oMcCxrycgVmZbiWLGpuvpXx3Ml4Wx8a
         bZs6oAm5zLuKTkkOyvDgKUT6W4g7efbESTsdBfaUc09vq1wQw/BNfdpNRUmwigCmZ08U
         BIiRosmzyd3oZK63aH1X1c5IfSzn/J3uuXGH+QVbmoTP6r40Ksr17ENcF7PZOIxtEqRn
         aOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735842; x=1788340642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx8Hit1v4ESGkplelGk4y1PT1ozgsKOulMxfjB8JQNw=;
        b=Jno+p/02UFCr6mCouDD9mAQ21Il39W8Ja7GslBNM5cY+kf1tgVC/smDpy/BkYaN5ay
         AsgS6q/8m8Fda3TGawj+B0mqV8b9VR/mzGgara3GZeC/PQNvRTJL+YxS3qWDsvxImDMM
         aXKAGiFUjLT6mt3+a5y1k6EtAQ+iMa5J8YpelIPU3HgVs7RN1GrNEIQQQ3tVZNrJ1CCM
         /+coFt0HLO6mKSkKHM1y9RN0G9RQjPbsxKm1VPad+lYP643pw5wYqWSxmfX/3JQc+NV7
         ++hDK3lFBt5JAqnjiombOFAaGQqDwLnaGYcUu5TqsZxG9IkNh8H10XHXlG4+Ek8eezkt
         tLVg==
X-Forwarded-Encrypted: i=1; AHgh+RrTiEhVG1AURHrJUuO+JpzHDp+2WZoWhTC4qV8VJtYNbfuVxLLBj/9Rq0cuJUDtZP0MGC0LyHh6wjnt7U9s@vger.kernel.org
X-Gm-Message-State: AFuF++lXt/moBFA0HcGkISV66AjENu7pMhNs+iAMFjR+Ff7zMh3ykm+2
	kmxYv7AGc2JfCINpnicMzIIoVL//qHIBKT2dqFLAPGhANSlR39cUN5bPqejUcIL+JJSdX1b8N4b
	Zi9T2IpQPD4/lULce1eddDCBGRKSA7J0fIm9L/vfLkTJdcvqjo8SSrY/c/CY4L8lS7mKg
X-Gm-Gg: AR+sD137oV0IEc8vIvQ7NMik9fsuXHqZtBc7CoQMMHamnFoeIYfTZ3CdKf3DEpwr2wm
	rnR5oIgAT5yvMjBHmQr5femYsCdtoldKdvXWxaaYdYOEWfrU2sizJ2tWkx9QKpKbdyLyxjHJ/5E
	eyczPgok/4/1Vx/nWTFK3PjzwgqagjC5Y0qXHYZl3bGePu8URLnVdjrD7RiWekP45L1g9jEb6mR
	s8Fc+3sKBpT51i8+TisF7mqsGDETuRiJ/kHfAvQRIWFHJvNxVxhtnj+5rF0/w+5mVpFiUmqTy4J
	LFN7C7ranLHr3RqzlHjGvWcSgQXeyxDhp0JS+rUpE+SUWFpKrbYYAJaZ0rakKmQbGD1iU4GlhWR
	sq2ETuJXIy08fpIPLJVdOQOlU6kwWscceD6zkxwyM6RndT+Gl1/zEOVJYH4+KHq/Izmfi7nde
X-Received: by 2002:a17:90b:2e4d:b0:396:4d8c:6c4 with SMTP id 98e67ed59e1d1-3966d88242emr11913043a91.14.1787735842292;
        Wed, 26 Aug 2026 02:17:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4d:b0:396:4d8c:6c4 with SMTP id 98e67ed59e1d1-3966d88242emr11912551a91.14.1787735839741;
        Wed, 26 Aug 2026 02:17:19 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7084981a91.9.2026.08.26.02.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:17:19 -0700 (PDT)
Message-ID: <13ea4f40-5b99-4a8c-b287-b0117ffc4bf1@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 17:17:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/25] drm/msm/dp: Add MST support for MSM
 chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <vd7njp6lg3yzydwtqmaepjt5kik2akqfcpe26faowvu65pfkow@bieyxaivjcqz>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vd7njp6lg3yzydwtqmaepjt5kik2akqfcpe26faowvu65pfkow@bieyxaivjcqz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cgq8okkepEEOxeUVRjo8SfNOjiJWTJfX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX1Jwxv+2cKlMZ
 2oP8IG+J5X/4cpkXPp9hP+xis5XJLVm4emDALj9HGSSaXjXFXsNxuUSXpRExYsMlLkJk6hyZmZt
 PqkHYm3rpm4QlPJouGUQ+a5ovHwGPtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NiBTYWx0ZWRfX9BZvJD51xqp/
 e+etcpZiXHagmlgiDQqq0ivxNdp1SoHH/rHUGHAhHRr5kHcl/jOY0SxdmwSZQ+vqu291Z37aIBy
 uzutxBsk97NgdqLTA4/JdF1JQF8+qc97w4MUI6PQ6hLrDs0rooX09viBI9ZzggM3q1+IuZkOh2u
 IP57fLs1YgcLJ+0a2yh4yVVh/olpityS0+YfHxKAlwaMJQFYVDVnDYob8vNt1Wm+oABoCm6Akzf
 8Knk4AEy/a3T7+PvNzLZLeKipTGnVfYW6Z9hwkbQMskn5bjlvph4y+DkzaH4j37HsGyND43a38Z
 i3NGjD2I319MNsBEgDK5MXN0EXqzqauOY5VnafNK2tTPSUqbWbqfKuNVIoQ23WHDtZ3ikPuYxgB
 Qq7KuhZ8fsuw+PxrWJVmjvkWMUNggflXo9zaxYvPPFxkibibIHzOZEBSRKOCTR0/uHrTYKgIqPO
 X0sYaVz5FTPz5OZ68kg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8eaf23 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VUz1-vWGrAybXlrDoZAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cgq8okkepEEOxeUVRjo8SfNOjiJWTJfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260076



On 7/12/2026 7:04 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:21PM +0800, Yongxing Mou wrote:
>> Add support for Multi-stream transport for MSM chipsets that allow
>> a single instance of DP controller to send multiple streams.
>>
>> This series has been validated on sa8775p ride platform using multiple
>> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> Type-C?
> 
Hi, I'm planning to send a new revision of the series, but it still 
won't include the Type-C APIs. There are two main reasons:
1.The Type-C flow and native DP will eventually use the same set of 
APIs, and the required changes are mostly in the DRM APIs themselves. 
Because of that, I'd prefer to discuss and enable Type-C support as part 
of the DRM API work rather than in this MST series. The MST flow itself 
is not fundamentally different.
2.I would prefer not to make this series depend on the DRM IRQ series. 
Keeping them independent should make it easier to iterate on the reviews 
and hopefully get the patches merged more quickly.

Regarding the final MST support, my current plan is to add the Type-C 
support back into this series once both series are close to their final 
form. At that point, we can bring in the complete MST solution with all 
the required pieces together.
>>
>> With 4x4K monitors, due to lack of layer mixers that combination will not
>> work but this can be supported as well after some rework on the DPU side.
>>
>> In addition, SST was re-validated with all these changes to ensure there
>> were no regressions.
>>
>> This patch series was made on top of:
>>
>> [1] : https://patchwork.freedesktop.org/series/167458/
>>
>> Overall, the patch series has been organized in the following way:
>>
>> 1) First set are a couple of fixes made while debugging MST but applicable
>> to SST as well so go ahead of everything else
>> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
>> of the work as current DP driver design had to be adjusted to make this happen.
>> 3) Finally, new files to handle MST related operations
>>
>> Note:
>> Validation for this series has so far been done on the latest linux-next
>> on LeMans, covering both FB console and Weston.
>>
>> Type-C MST support will be submitted shortly after this series.
> 
> You end up introducing issues which are fixed in those patches. The API
> changes might need to be submitted separately, but the rest should go
> through this patchset.
> 
Got it.
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>> Changes in v5(fix comments from V4):
>> - Dropped early refactoring patches (v4 01-12); restructured as
>>    "move link-level teardown", "factor out _helper variants", etc.
>> - Dropped v4 39/39 (platform MST stream list); use DT pixel-clock
>>    count instead per Dmitry's request.
>> - Patch 02: Remove artificial max-stream limitation check.
>>    unify register naming (REG_DP1 vs MMSS_DP1).
>> - Patch 05: Calculate ACT wait time dynamically from mode parameters
>>    instead of hardcoded 20 ms.
>> - Patch 08: Replace start-slot loop with direct math; fix commit message.
>> - Patch 09: Add locking annotation "Must be called with
>>    msm_dp_mst::mst_lock held" to msm_dp_ctrl_push_vcpf().
>> - Patch 17: Rename prepared flag to link_ready.
>> - Patch 22: Move drm_dp_mst_atomic_check() call into msm_atomic.c.
>> - Patch 23: Replace bridge-based MST DRM model with encoder-based
>>    approach; remove redundant bridge layer between encoder and connector.
>> - Patch 24: Add drm_edid_free(); add FIXME for bpp negotiation.
>> - Patch 25: Use dp->plugged flag instead of link status for MST plug path routing.
>> - Link to v4: https://lore.kernel.org/r/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com
>>
>> Changes in v4:
>> - Fixed most comments from V3.
>> - Rebase onto HPD refactor V5.
>> - Fixed casing/formatting issues, for example: “mst”.
>> - Drop .mode_set() and set_mode in .atomic_enable().
>> - Rewrite commit messages that are unclear.
>> - Use the same API for MST link and SST link writes.
>> - Use the new drm_dp_dpcd_read_byte() / drm_dp_dpcd_write_byte() interfaces.
>> - Remove some unnecessary payload fields from the MST bridge.
>> - Remove some defensive NULL pointer checks.
>> - Reworked the patch order to make the series easier to follow.
>> - Add support for more platforms.
>> - Link to v3: https://lore.kernel.org/r/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com
>>
>> Changes in v3: Fixed review comments from Dmitry
>> - Fixed lots of comments from series V1/V2.
>> - Rebased onto next-20250808.
>> - Rebased onto Jessica's HPD-refactor branch.
>> - Fixed formatting issues in commit messages under changes.
>> - Removed unnecessary one-line wrappers.
>> - Relocated MST-related .atomic_check() calls to their appropriate positions.
>> - Removed the logic related to slot checking in .mode_valid().
>> - Link to v2: https://lore.kernel.org/r/20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com
>>
>> Changes in v2: Fixed review comments from Dmitry
>> - Rebase on top of next-20250606
>> - Add all 4 streams pixel clks support and MST2/MST3 Link clk support
>> - Address the formatting issues mentioned in the review comments
>> - Drop the cache of msm_dp_panel->drm_edid cached
>> - Remove the one-line wrapper funtion and redundant conditional check
>> - Fixed the commit messgae descriptions of some patches
>> - Reordered the patches and renamed some functions and variables
>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
>> 8618d42a99a@quicinc.com/
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>
>> ---
>> Abhinav Kumar (19):
>>        drm/msm/dp: introduce stream_id for each DP panel
>>        drm/msm/dp: introduce max_streams for DP controller MST support
>>        drm/msm/dp: Add support for programming p1/p2/p3 register blocks
>>        drm/msm/dp: use stream_id to change offsets in dp_catalog
>>        drm/msm/dp: add support to send ACT packets for MST
>>        drm/msm/dp: Add support to enable MST in mainlink control
>>        drm/msm/dp: no need to update tu calculation for mst
>>        drm/msm/dp: Add support for MST channel slot allocation
>>        drm/msm/dp: Add support for sending VCPF packets in DP controller
>>        drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL for MST use cases
>>        drm/msm/dp: move link-level teardown from display_disable to display_unprepare
>>        drm/msm/dp: factor out _helper variants of bridge ops accepting a panel
>>        drm/msm/dp: replace power_on with active_stream_cnt for dp_display
>>        drm/msm/dp: Mark the SST bridge disconnected when mst is active
>>        drm/msm/dp: add an API to initialize MST on sink side
>>        drm/msm/dp: add msm_dp_display_get_panel() to initialize DP panel
>>        drm/msm/dp: initialize dp_mst module for each DP MST controller
>>        drm/msm/dp: add connector abstraction for DP MST
>>        drm/msm/dp: add HPD callback for dp MST
>>
>> Yongxing Mou (6):
>>        drm/msm/dp: add link_ready to manage link-level operations
>>        drm/msm/dpu: initialize encoders per stream for DP MST
>>        drm/msm/dpu: expose dpu_encoder ops for DP MST reuse
>>        drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
>>        drm/msm/dp: wire MST helpers into atomic check and commit paths
>>        drm/msm/dp: add dp_mst_drm to manage DP MST encoder operations
>>
>>   drivers/gpu/drm/msm/Makefile                |   3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  40 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  30 +-
>>   drivers/gpu/drm/msm/dp/dp_audio.c           |   2 +-
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c            | 473 ++++++++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h            |  17 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c         | 394 +++++++++++++++----
>>   drivers/gpu/drm/msm/dp/dp_display.h         |  25 +-
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 583 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  14 +
>>   drivers/gpu/drm/msm/dp/dp_panel.c           | 197 ++++++++--
>>   drivers/gpu/drm/msm/dp/dp_panel.h           |  20 +-
>>   drivers/gpu/drm/msm/dp/dp_reg.h             |  68 ++++
>>   drivers/gpu/drm/msm/msm_atomic.c            |  14 +-
>>   drivers/gpu/drm/msm/msm_drv.h               |  19 +
>>   drivers/gpu/drm/msm/msm_kms.c               |   1 +
>>   17 files changed, 1718 insertions(+), 190 deletions(-)
>> ---
>> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
>> change-id: 20260410-msm-dp-mst-35130b6e8b84
>> prerequisite-message-id: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
>> prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
>> prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
>> prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
>> prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
>> prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
>> prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
>> prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
>> prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
>> prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
>> prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
>> prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
>> prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
>> prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
>> prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
>> prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b
>>
>> Best regards,
>> -- 
>> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>
> 

