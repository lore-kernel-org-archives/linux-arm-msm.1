Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005914;
	b=NYVPdoV1+UbO7z/A6E7XGXchBjHkajjdE4J3lDNs6mZCFb8E1KAZ8V8m8JqXVX/xvrqd
	 8uhGLs/H4T+V5tkvlOtQ5F178j/Alvm5ffIZFczC5jHOOOVojHXqiPzJL7AuAe+Cn6RZv
	 tT3ZKKA3vIQFy0BJhJn1ty/sUXLH359EjDmIJImPOg/pSqbh4DVrxYR2fy+Qn9y8e6yN3
	 EYXUgvyOSHzYu575sxKrE3YLBHCzFzWbDmkdqs6K7HO5Ka2aPpRjyzZ+L34FfRhHdnUJv
	 vonnJ2pHsY+N+Gh5jSOSU/XXRwlVXKyTRt7400KqWeAvqbmL0sF5eVpJhl9BKkE60Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=;
	b=T/A/dxsDfXIIf5vs6xUORwhGNh5kKPsTIyPw1WNV4qZPTWojwNvHGjgrZIcEDO4vUq9H
	 uytdu11TYnJlgqll0Lnlc73mA2R+5eSQzxgZvS9lp1/WmwFQiWvv/JFbGd1b6DBgrInzn
	 NEJrICOH1Hhx5gA6lE2K2jVXXFsln3aRZQZI6gp4liBgy5KsGs8wBnAaLo2m4YakRxPV6
	 a1LYSZunWBNiupy1UFAYoxE24kjDaq5buixNxhceDM94f6T7063kkPbe8A4CkpZRodGA2
	 wBt2hcWgHyjPZB6OyyhHtMi3AmMPqYgszpuNPHRccEUiG/IpFBeJ1Bj6lOvKNMJumSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM1cYYST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AsuH9nbu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF30606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF30606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM1cYYST;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AsuH9nbu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auQg2255115
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=; b=AM1cYYSTA37KxufC
	Y9gCmJaHvPM8awTBsY97AbFNn/5c/owS0kW6fy15Ri9NiVS9o5nrNAHLFFoJ2HEw
	aJKbm0d5eJGmj5yj8rnlgqxBLtoekUOIRSYMh7IWS9GjoJtjZ0s57/W4lGmThLFj
	/O8/iiJAr6xLsRuQdKrGuRHpbX32hYprGHTCVK9PYWuGbX2MxfJH5EIV8I4cHQ+Y
	Hgy1iCBzc1bXClRZhAcPbAS9Jxj4tfWf6YL02QW2BHYue6CbdY3WgQPz4Ho57vMc
	DTiaswtRB1q3ataXB83m0qnfOAvqIwe6xsWXpWkf2N64OwQZnbhL/9hghwj33Je/
	WESGNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nkmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:11:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso42323685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793005912; x=1793610712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=;
        b=AsuH9nbu2dudD34PU+1iFouHgvRpzC5YIfAdY9UaZvEOdUE+nrbZs78ec4zH+6eJzG
         AinFdaGkQBuINsFdRlWXQTI0QtTCeN98NyrgnuEKRRArsu6r9nVizrGSVjP8EnSzSkqg
         LfCH1Q8WKvfMVjp4TWLFf+L8eB09DqdrAHJnbypgjx/dZ0LZcJicLd4CuOgXHTmpZXF5
         FDiD3V9XnONoj11xu7TtGhSQzkf+ezJOr+NAGSRn1v9qCOsi3KcKaGHR06FRtIrAvMPg
         1BGIK95VRdIUT7ofsHq+hZ/NZ+TfKzN0L66rv08IYOkq5sKRQjUevjn64bvd0t9ToVwI
         5MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005912; x=1793610712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=;
        b=guXOxZ/b2HJe5ahit3mzctTMGPl3cJ3HBOOCg4cduRPBiRkHaeuHLj39brcYrroZED
         vomoFGuYBwCAts82WkcJovQQFC3Zht6RDvCXVNpBkrkB8ZbxQIsCaRP9IW+JKQlbdIwr
         PGvgpN/qfxJUZjrAdxr4AonY5iRVAb3p4H7oebamyBGGrgNFkJnXMF/r4s3MjnqaAAob
         SIj1xgoyHp4ecyEiHc/KBUzuS83BQZ94p3cuYnHAMVdxuuG3JEbmJUWbcf1tCn4EGIMf
         ltrvZQ55dVTFn3lImfiFS8VWSDi24y4zwnqI1Bd+YjxxqgOZze39N/P6vJsSkIV1gX24
         FR+A==
X-Gm-Message-State: AFq9FYJah1fCWRZhtkE1xSOTSbiQH8pcTxOz19+mSCVsBUKDqB10fYCD
	bYSlnO5SSdjqDUnZbA9mMqgifIbssyYha22kYM4gQCONk/G8+uMpZNtoCdLKjmlLpvAjJaxgy0M
	s1PM/vilQfWhdYlI+aI99PzhpFg6nmFOG3frD6suBpzgJ4G+FHMciXrI5DQmraXLbPbzc
X-Gm-Gg: AYBFou3UwuRAxQBTC1Rgf/xCgRtovHk/HR+rDiOFo30P3SbdKT5ov8aBzfU2QfSmT5/
	ecmyhUFltYW2ZHyJvspbUvM7IpCqIJKvNy02rVXMAHfDVhZXBqaMjtT6eQc6VAfAp0FDTdBtozT
	orxlvswF3dzK4v+mu+1mzY+bOeJ1jJhvTLMUOCQLHPzmaFXJoXQNddSTVEwDuh5ESkHQ3lCpBaA
	Fx8rjFbLhpMdYVz0oZzMpUamCIvr+mAn9+PnPV2dQt4FNDb98ST60x+6O+oZdoLA4nC35/Bevtz
	HL1mZDEQZcROdiZvbel4W9AIHgWmAnJHsJa9eMoeAlhk3yk22PtoTnfdyjz/x0q7vhN5e3BG955
	ZkATnqcDDSm6cvoO1EBDBwQ==
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr999829485a.3.1793005912415;
        Mon, 26 Oct 2026 02:11:52 -0700 (PDT)
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr999825585a.3.1793005911851;
        Mon, 26 Oct 2026 02:11:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459711d2sm3281710a12.17.2026.10.26.02.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:11:50 -0700 (PDT)
Message-ID: <c86259a3-f719-4e92-ad8b-a0cb6e1d685d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:11:48 +0100
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
Subject: Re: [PATCH v5 04/10] drm/msm/mdp5: flush the interface before
 starting the timing engine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-4-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-4-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x0X2vvMUZWPonz7e2UUdRVSgq2RVu0zv
X-Proofpoint-ORIG-GUID: x0X2vvMUZWPonz7e2UUdRVSgq2RVu0zv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXxuzbeyXxI64W
 X5zt5ySHiSj82agEHPE9M9VdlCsxqP405LU+WoJ/X/u4L/p3uJcO07pHaX1pvtOglQbKnqOpORS
 LO+TciNEiCR+I4J5FG/pmIfgdxS25v4=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf1959 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t3vDU1A9I6D9DDbkPvEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXwrI3Zh4FhTa/
 +Vq62nrzN9mariboblrAkSvXs60iWthmLyHrCzEbYk6/PCX2g2ssRzRCZuoyxoVWofs6rise7/j
 w0P8lrHNQZybAv/1K52v345h2rbOwoJGW9PEHwiHacOsMOfNEYwluRJsKIQAMvrzDQIQD2Rpmuh
 ugt+XDH8RhMbOQBJx9fTVH8P84+5MUZuqjIJFoRabA/zT0yK1F/sRtSLmvLmWwugPDU5vUaw6XP
 vr7qqIUw5o76aqrAtY5aNdWH5FqOCQBhV8lBgx4tMgnNOihNhcezkDG+7v4+KZghNi0L6vC+ePO
 HXrf0EHLcL7AwCyvcxCXe000xKlVkE6bitXGpZFUwtqv7cuEYhTNZnkF1Pxs1lYwhK5JgMO9kTK
 Np3F0N/+dKF7nC1syPp1eT3OCdFeHpOwOJ3vVgo7pGSmFaj0/1L9DZqZ0oMEoKdcZc1V/uzLIz8
 v/gasQ1ljaZhnVNQ+eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> Disabling a CRTC and then enabling it again can produce an SMMU fault on
> MSM8996 as soon as the timing engine restarts, e.g. when fbcon takes over
> after kms_atomic:
> 
>   arm-smmu d00000.iommu: Unhandled context fault: fsr=0x402, iova=0x01fa6e00
> 
> The faulting address is inside the framebuffer that was scanned out
> before the disable, which has been released since. The pipes keep that
> address latched (CURRENT_SRC0_ADDR still points to the released buffer)
> because the plane removal flushed after the timing engine stopped never
> takes effect. On the next enable the pipes are programmed and flushed
> before the encoder is enabled, but that flush doesn't include the
> interface: the encoder enables the timing engine first and only then
> flushes the INTF. The first frame is fetched with the latched pipe
> configuration, from the released buffer.
> 
> Flush the interface before enabling the timing engine, the order used by
> both the DPU driver and the downstream mdss driver. With the INTF flush
> pending, the whole pending flush takes effect when the timing engine
> starts and the first frame is fetched with the new configuration.
> 
> Fixes: 06c0dd96bfbb ("drm/msm: add mdp5/apq8x74")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
