Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582444;
	b=WBQCl5flYourfsFWTENpfbU+sNLNn+FVD+mOSemWIWTwT0KrIA927zEA/hMmj6XJhliD
	 lWip+dRfIvVf9+yF/aYWbouzuvq8kf9I9d8IJoL6DaV6LYNTK0sAQiskZc3v+yl5rVZwy
	 GnZfbzNzGfuQdp6c6tixKN/Pbvi5nTspzef9PsIGdbhV8VOtR1Ad0MzXaYpWlnXd9H4HF
	 pqVN1qvWNbWz7j53jKnldo2IkP7tg1y1FpInQryme8c3+50/hM8CI27n+6wi8f2zPlD9o
	 CMguQoAf0/wljRFBxmHQBiGlpGSR1bvBP6V2mPNJlN3f096OEpqnL1O0ienfq+KnveA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
	b=E8c+HBHJwU0aXJLR2wtJl35D/PM/7FXZkCQDcgQFza+IqD17Utw8FzauO3XK3MA2foAZ
	 kCy85gBJYKEffRQTQiQTkXGHFQCxQoWAVcuUrVGrK33XVSv9l5JOkrJBb4y7yvoC9I/mi
	 GQSI1NNV0n3/CE7CVjBxP27HouVAEg2h4JOa0pjpV3vjU+ysa8aCh4mkrCDhIUrSY10FF
	 sjONhyxZZ/iWXcCKC0jQwFTra/8f/JU4WH8Uu+fABenEtp38tveMeBw3AU13rGMxJ6vWl
	 y2e9usDSd9k2lGWkSMzKKWjlWYUekS0n/9YjtDhg0QvSPjsGxyYKMtmCIC4DfZB4Rsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4KQfzU9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NlXMfP8Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAB606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4KQfzU9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NlXMfP8Q
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BRE93112081
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=; b=l4KQfzU9Rc99lK+V
	nzj0GpWMR9ZTrp+ng2TtKfpbVTLmMGKE/7Xq7JL3KIUBubUG0ACAJZPToxrlD+sQ
	3pu0vOv/lBWMNfHDGgTxkN8BfGVxREQMD0OuGmohCSHRoKMQTZuiAPq0gBmZhBq7
	HaqCbfXV7EE5oD2cuyNMP4ASZKI/yI2lKoGExHLw46voeEF6SD8pn4/BaXB1V+HC
	uhBUkk0IIflK8NedFUpB8LMPsI9fKiTlDRLZo3QdFV/FuT39GETZFrRu+BCSnnFl
	McRY2fZiqlknjN0ZviKBt1NVNPsj0B49N85i8UkpOtdO8I+l8aXGiCBWbTzIFzJ2
	OTi/aA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b803j9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:54:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131befso790054785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795582443; x=1796187243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
        b=NlXMfP8QGmJZYk2YJelAIOl9jpWUPUKWY6bx3zuGIAgjB8vpv/mFlbHckRkp8+S4SF
         +AWhq3yTYfgds2uLKtYkMNzegywQqP/MxsJA+nXkr99wS2Fd3Qk95SkYtvq9uWwGINg6
         Tup2muY6M1eJE/nvZmWuD6aRolqk05TUuX/5QqwNfP+tWb/avNPEaWTxSLUPgAZ/JQvy
         +xSC+Qd9wOqNYxaUKPIqU9pWHlZegTw5Rs7y+p5Eo+HRmYlRvDmGO6TRhe8yXiI3fEQQ
         38tMdkvI7McuWlw9KGHkewQPE9BToLmglsr4v0qA3S6yHQnxObFGADlWTibZF/JjZC/x
         dTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582443; x=1796187243;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xR7RhWJqTr/aczzO3EIq1crgEudqfPhwaC9mSHTF0TU=;
        b=bmj8ohSJxJEunzXq33WdlTFrustwp4yWyBfbXHLqE1eoZ7TSSrmJqK8r5X3hdY8Y1E
         xFOtgKErRyxB1Mz2oa3ukXuGbSG81ntp2KgdrgzHLUTqS1n9cegiB5cZ9PHg9qof+w+y
         GEB3lgp1qN6u3kufFIQ1IEPulZYye90dl8itrq9DXLiPNcM17u/uKXPf7Qprz4loSHsn
         iNQJIsEXEMOoiS4lLHaTC86i9fTM9hNLClRNm98DP2OHleI3TO0GzDSKFN+q/o1wCvvA
         at3qV3GmiKc2TVXfdKnJY9ypCMzAb8J8mLXPFC2VuDZzzpzLs01UmYSyTjrf67tuJcNT
         CVkw==
X-Forwarded-Encrypted: i=1; AL+hErHE92mO7B5G4tMdGiPH7/fBv+wudMCj/mgwU1wjBESgjA8lqa4fwCmW9NacJpi0oP32Co0WdC6kfqBRhH4W@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Jorj/T1zDn0ytInS+T8sKNgdIP8wpsHpG2K9N8XifS5ICCNV
	QQbfDjGIfyExrCm4Ckm67LQUwLyvfgpuor9pU8PPS7MYuE1uIsxK3oXekvA+1rBlKIMC4B/D0P+
	p2Oex0RRvxSsuOFYZwUVu+5vmW3GvbMEdUcsyDBYfurGHD4XeWbIAEUoj6V9FIyaeUlks
X-Gm-Gg: AZFdTZfwaynbv29eaAld94XNgFMiAska1ERakgEjIEMf5uUtu6yXpeqJa3y2jadf+Tr
	FEb3yYwpettzAeNJha/X0TCtIeNaRdeH06ySYkRDDC9aZOZ/OWNVZeJrjuNYEChnFpNo89vsw88
	2L7Ip7YDZGf8WA5S0vvd+Lj+MrKwps8B6PLQATVvBEpoTpBXh9ddmZJhORqqUqr1+GcPpFZZ+33
	bx88AxWLntbfbghZzUy2rzo7uWwPYElu8H9uXtgxNylIAl6w7iLBTfDV4o/J5b2XEAfpIhBm9vt
	moVOxeGEmDIdoHQjjzFD8W7zG56PM4HGYYtXCvd0kSE7ZwIFl7WEWv1PnTcK9KD2+ljZXecscsq
	Tk0mQ3nql19fjxFyyu+Fpje0+Zznr1P0QPqEzMJLMwHNS0WtwvxqPA48yaV5sB/EXRpI/HJ7YFX
	MitAF1IO/PWwKU1VRveiNexjYVMu+e5jaxVJzohkoMjxuNIP3hGYoEAzUIy7ePyg==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr24608285a.71.1795582442587;
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr24604185a.71.1795582442056;
        Tue, 24 Nov 2026 20:54:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm4243023e87.17.2026.11.24.20.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:54:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Message-Id: <179558244050.1572056.6952667613622271304.b4-ty@b4>
Date: Wed, 25 Nov 2026 06:54:00 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfX2wtHHcPp6X/h
 C7ZxGJ4D2EsLGEk63clAs2vz/nVeFXq1ZWdWPjS2CRgtU9/W1bcoV6+A535ln8cVkqPlPoatj2D
 YUsIuaIsqK6mD/pJ+GMElkuxtCCWToNKUQzMFsO6greD3MvWBWzvpSFK+B2+85tp/j+OL/B5ewq
 TWR4PMMDn67q3DErVwYpZaBs6hkN1DAePTbLum0/dl88q71fgNBTmnCGFcxUPHn3/TgEwJxKBEm
 Ar2VJJEcsmNN9ldpvSlrUcXyb0VF6TXxSSef/lsf8IQ+4dNo+dn7TBQvpsx1SFVdovxKguNESP0
 1/95M3vP/BrX+CgXwP2lAcXeNVkcQ74IWfcw0/WFoy/PhgjgFeztd253yPPcFo8TnoQPSvajA1C
 fn9GTbKcIx6x7pVY4qvUeteHACqonTy4j/cxKNacVERQPPgZhZxlnX/bjajEqPRZcyGlTz2vCfo
 pqbAN90NSHSt07rRkfA==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b0669eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VUr37Z-sP6Vbzkouko0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EdozdVEG0_rwf9GMQLYC-rSSbONDPDPh
X-Proofpoint-GUID: EdozdVEG0_rwf9GMQLYC-rSSbONDPDPh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxOSBTYWx0ZWRfXwxGIBsQxaldx
 qWlE18cKuDuU9wwf1odQ2aJJoSWMif+Z+CeTMVdz5XLLSQaDdYT3XkrfZ9fL+AkwSprELeJCvC3
 285spCe339nfRjNjIhwBKMQVdul/qw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250019

On Fri, 01 Aug 2025 16:51:08 +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> to use drmm_writeback_connector_init(), drop
> drm_writeback_connector_init() and drm_writeback_connector::encoder
> (it's unused afterwards).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/8] drm/amd/display: use drmm_writeback_connector_init()
      (no commit info)
[2/8] drm/komeda: use drmm_writeback_connector_init()
      (no commit info)
[3/8] drm/mali: use drmm_writeback_connector_init()
      (no commit info)
[4/8] drm/msm/dpu: use drmm_writeback_connector_init()
      (no commit info)
[5/8] drm/msm/dpu: use drmm_writeback_connector_init()
      (no commit info)
[6/8] drm/vc4: use drmm_writeback_connector_init()
      (no commit info)
[7/8] drm: writeback: drop excess connector initialization functions
      commit: 7bcb37603df095e56e87d6144201179fe911e4dd
[8/8] drm: writeback: rename drm_writeback_connector_init_with_encoder()
      commit: 81f61b4e0467ddab3695be58a94fc322c8bd559a

Best regards,
-- 
With best wishes
Dmitry


