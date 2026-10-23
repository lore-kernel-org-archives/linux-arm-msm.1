Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762825;
	b=dkQyDvyELXblAHDcT3uV8aJXyvt4lx8b8jGMfo0gpxuP7oDMKaTHgeDxX9zK6Ewd9O1U
	 Uya98gZw4J4jLrNQaOPpn3NLiVnUh/t/pzMUv7N5FBitVs9PfWvReIuLb1AuvXXg7b7fl
	 fwFybLzEF1DJFw2/Ww14qhoeVwfhUYqgHjMRB78QIiLuT2YiOxUbapt05RgJpqQEUFY65
	 en/8NuLZLDf6zkg7FxEvECzIX5vfr3UOgW7r3QfyWlFhgDTQEB3Ha2nfY5efrb+oSBw+p
	 eu9hFEstCZ9IRrRBZ4tHMvZy8X7YJ2rcJRH8afyXho1vZRfe5KSve9bfIjbTIRZWwoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
	b=H32kMYiXmn0t0fRRb0Nsc0L/YDjctrx/OPWGLwVe19HEk+V0vAshcFVHUG5JXVxBytV3
	 uq7RvL+UvW1m5KkLM74ghSzAmozqG4STPq1tqyQO2ty6DHHDZ8VyCYRhyWCp3aT6kHxl2
	 tQ6pEqXENmTM1TbwGLRWa5GCfjpAqclZ67e2TgNpEg+jdMuBIeasbpuiQ1Ji3CsD3tOIx
	 Hh6/00zZqrZ/s85B0AZEpWVLcYXdEeRn5bRSqx0AgFHR181DrySWEpSeMEVy7L6tNI+8z
	 ZtYZgcz/LIcUdjMrxlITKB6c5rLurGNsP7njkrI+EFqUnmTjTEUMj34DT3SwKFJOVTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwJovSwb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXgk3UdU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214E60A2627
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9214E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwJovSwb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXgk3UdU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAEII1597339
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=; b=lwJovSwb4feHyeVB
	XVS8i1jLDX83FthRRAPJfCanB/3BSMGjUOvUbEJ7GV/719UL2R0sP3KVEsGiWZnK
	BLAhSn4BDYalJdgXokzGfS3FIKDboeACnQBrAp7wkQguVVW3tmvAXtNvcWkH20hz
	WR0bUOfeUMavoat6S4u6qELaK5fQLaDxGlZKUS+g0Npv8xzgxCwHFVKuuvOkiOC+
	00t96YGBhun0M8O7kMAHATR+Dl9x+ENVmdyDvigScdIzXCrZ7WaKB/HAlqJAtWZg
	4TUVR47GqCQWjtLDF40nzzzKAfmxwKHudor7RxU07EeNRJjoP62tD+pLLHtQDzlA
	SETExw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so182606685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762823; x=1793367623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=OXgk3UdUo3EE1bzHJSZNrRgDpmHHpvewH0lZQmnklYbDgd++Af6fV9NKBaKg/kHpTE
         BmbBBE+Eg0H8R3MBDJGYMSMgL4+jsJs622irZoleNkDSoOhDT8QLBaK5suPbIMXkn+f/
         /ufaMA/eat7A8dIT+jnDBCQlxPA7IO2SKzcakrsU3uTf1PpEKS2HjZbzH/5eweT/mNdy
         ioVXD6c/OGpOJX50clKYzGNVZnUNdilJFBwn1jmRkjlpteZKxEPgDCVm6YIKAPdQshCC
         lG74PFkauFC1+4pp+uAJ87KEhmEfs0tZRiloTVu+uEPy+jibs5+ngaCVheDvzBjEHrWQ
         sjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762823; x=1793367623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMjekKslBoodemGPPh2ySDDLJdT5DA5F/zIx2IC+Abs=;
        b=mITodCq3NGJ2C2LZOskm/nNuL/0XV0ixDEdTL77DpZWVjiIc5WPaBEddbJaxei/r+u
         rIlkl9KzUqnjimwfSI3QdwnS7JI5jiWnzsigNyBPw4dlGntTQBIKPDQKDGtGJyPYm+zH
         +2/tlk8abUA0UBw/c8Yf1LBv13ms13k0To8PXrbev3j3bhbx8Yfzc1k4HeA+6uNnwtpn
         kH3SjvvgEVsYi+D961XGYbcUwDmL8ST+dlbyqcO7puZedZA/QEpj1ueY0EQ62ofwPwIS
         NFEklswETowUWtNj8M34MxOFByGch3/3JRp1r6pSKEsWIYkkiGFyA0/sTkSL17wteUIJ
         w38w==
X-Forwarded-Encrypted: i=1; AKwUvBxmu3tNK2kbHKKmJwQfaDw49fSOtVW2tn7xh5n+t6I4XUzL6sx0MJRFoydvfz9ax1RRhRGZ/MxiPN5zmi5T@vger.kernel.org
X-Gm-Message-State: AFq9FYJEGOyfoD6Bd7MWAaTCNTMV9+Loi5JoAcQHxDjb7OPqP6VsL6+t
	IQ18Z99O8bAX5eYh0aF/YBXTJTFjh1Onb3+jIlaCETrf3elsrUF74K/Im+zZI1lYc+p8hYcy3wR
	0Gtiw8P5+6rPuMqPJz8YUSOHd2vERn/U43K2t0UZinPRhiz2LlgQRu3fZ3y4v1JiIY6XU
X-Gm-Gg: AYBFou02Fx/B0MZVd++YdBofXHuwPFqRCTUcFRKnGHc7xMJvfQyDVmWDfQPLZt+y8fy
	RQXYyU0vJSw2BTwNl2Jr0AY97m9kgTMww1eUqFqLHxzmNolNdgQ9xtC0X/FA4QgC7vWh0AiZ+Av
	pEoxrNXoIYMAuiBZltPGC+Vu5EHJMoBdvtengiaNot3nW1ZHMJlMNM2iSB6+Q5eNOVCNv69ZgVl
	+0FMzk1uYgrux5wb7d+LuNPi9p0I9AnPpVR6e0CCT5m8vTtq5M670hOydu092tqcdQi8yZvTI2n
	EH5Fqld9vDA8+fAjwFS/56+FXnJ2VKd2ZtvOfBS4M+VgaKITcGOoyhkihjDIumRgSUAuf0cA5YV
	lkUNuJA6V/5gFUvYY4sLtYVwErSU8aspGpIP5hxk9Di/ZLa6LDeSuC98PQFkBye7ANOCtPF0Glw
	==
X-Received: by 2002:a05:620a:8082:b0:93f:4a02:ed99 with SMTP id af79cd13be357-93f6271feb8mr827057685a.20.1792762822246;
        Fri, 23 Oct 2026 06:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:8082:b0:93f:4a02:ed99 with SMTP id af79cd13be357-93f6271feb8mr827051285a.20.1792762821589;
        Fri, 23 Oct 2026 06:40:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:44 +0300
Subject: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD callback
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
Message-Id: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8438;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TKKw/H3SXfDs3PoOXuNmfA50Zj1t8JLh5+PJ27RzJ3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OoXQgMR8sNqQwwI15YWalXno5a6+AYYINQR
 SAiPVggL2OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqAAKCRCLPIo+Aiko
 1cFgCACEBUmVLLc54TGDOCvi6zS6Q7Sl8njhheMr4ONhlUknuUbc9tV5oj4bwHx9f03y5XbwUVu
 zt8ejw5xN5EpWtK7NzfJOVOIHPb3gPMCdYUVRwiu6dFfGhhMxMitspo2FR8jVmslyKBe+TQjfyr
 8tQtmrz2ZXfFSiSz9Wd2iiMf55NdyCOSlpyAt1pV037+x35+76Sm3ssLA9Gun4DjYQekPEVDKTR
 VV5FmqawDNT+6ELAsgcOJ7A7p9ip7CthnZmUsmWsNYPFz4ZgMCK4Pp0qqWNq2UaZT0W6uBITHas
 tq/KB+b4KxpmxwZAtdTpv4/zKFO2SpTs0H1tHTc1XLpzYDwh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX5+OAuR6jBPV4
 0TlcBBeq3d19bjiVHbEtug8ei0niefX7eEX+G2bb5bgQYKRh096gfg0PuGkMIgfiLnbgxhWpOEC
 gPeXoJM2gMOwHgjbKJEu5GuCTXYk6zJSltTU6G0yvxjrz/s1ksv0fI4z2QHNf2DFurnp4ft/RRW
 f2BTrebvTJ+zs3nqalALGlfbLLQzbzi5QsBU28nB1Qm1LRd+uXYL7wMX3vldVKMsm5UcxCD+9zL
 zYGtIjKY7sQK7H0wzhKugF2DLV3/HFoj3L6egv+P7c6zRS/U617wbQemEbx0uoHtM2/SpVX3QkH
 QVvBHy8tQhlQYt/un9CQ4zkNdXSUrgVilysXmRdUVCLYGQOQu6CzQUKaNC6wdOhsJG2LJDjlUB9
 oaVLLeu9dOwxblAOTe1qSnLCFbkax6YOpGTUuyG+U1spFxSTol9dnxV1ORXtqKiSk2CXepTWkDY
 ggpkOgsWy2I556JpeJQ==
X-Proofpoint-GUID: 2ACeRyzfdvhBxzYJkkBhQg1UYLsTwbB-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX2ht1m042p9d0
 ddNyZcPQMJdanl6q1b/jdlQHThHZzwS2z4YDbSzEgsw4PyXyA44Hk3d5ZZeBLxC9CU+GQqcTKNq
 TamyI8k/pJ+ogDQTYHLQv3pAYbSxD+k=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=KfJoKOGgR5IJitVib78A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: 2ACeRyzfdvhBxzYJkkBhQg1UYLsTwbB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 7 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c542ba6ce7d3..a21f9355594c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3

