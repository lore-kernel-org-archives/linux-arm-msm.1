Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835112;
	b=YZvx+ZtP4HDo3S+3slV/ZpezXWjBV2GmWvmv8gU+CLh0nWZCZjhLNPleUo2qeBlljoYU
	 wJhnE1ODC9pVX4EonbT91wxuicAghZ+aHgQFCUs3g6Kn932qIzhT6HzWNPWhr3Zx1DwOI
	 3ImBdUy/6oyvQQjQEyiTjAQ4IgScFxB1FpSqavnHridY0Fpthg88G0mppdXFy5/Xyl3jQ
	 zgqBy4quu0wqX8j65/xKzut7BCE97eLNXJkmgQsCfaUCSvAj7BdvT1GlnVstaBxezrcAE
	 Dji8HNonnyx3aNpzqjrOe/It4QDezaJZwAKrd4yy1P4wXLIDNM+P1rUrmCMmGzstd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
	b=gMkKreKQy17Kulerrq3J6C7HdAgZFyTXFH7dnU6rqz2PcLUOdSg8uAIkWg8ibMaoMen8
	 GRrDFlyAxuOuemiscpNAHoP4hr3ARvt/SUOrBGO6NBr/4EfBVeCp7HlWJcDmi5DqrKGfS
	 q1zhg7x+GpSSrh54KPqtAAzX8jl26NeNkYyaSJK0kC8ZBbul8YYWGDTqbS+w5jV5t0+Kp
	 tUNYFpAFxx6CDgivVr8adG+JrFparFzdAlKf44VxaZ3QEYz4geyjHVyXTXXAcqTyfb9BH
	 tXKLz4ck59yvToSKrvBFpANExa53ut73baRoTnu83lvuy7dlIkngPGuhtVDlrtnLAmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPpDFUWO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W6JJUiL9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077B606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5077B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EPpDFUWO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W6JJUiL9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC10Nh4069499
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=; b=EPpDFUWOkZ5L4D/K
	1BoTCAv07el9Qc7jt/26GUGF8ENgjQm4+R8ZyEaaSr/8vYF8ZDeaOicnrIYrZijA
	mZxTD3sfs/yujgTaHQQuIdEViZg+c3h7lCJqSFOeYe24TNs75A+Ag8Vzf6PeyReI
	1TS7u2A9ovivRK+q01qw6aTF9/zU48VVUF+K6H0sLqidRhRCoSe6aEpNY1Yo26ed
	oBmaBXmmSrwNB+vDlUpJb1Me9Ch7vzcaAbxhNtMOcBWfhm8q9xJB/sfVhGae62XK
	hp7v75ikoc5Udb5UQWxNXyVp05vfEibNk+euURuqhvI2f/nvrcZn9IX28SvW7lLI
	UOYqxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcehuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so352991285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835110; x=1795439910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
        b=W6JJUiL91kaMWAabhK0MliT4eb/tcns8BQhKQVyY/O/9tBrDS7yZ9TSxz8CzsbHIJC
         D9JijGANmJY2sanTqyiR+/aVacCqIe6Af47tuTcOj24RZKgghL0xg3bIpNUsKSgJ3KMI
         2taJ/VCtTYYIoK4DXXMufq6uksPNEbEP/UxnH00T6tlrYiz2rRwhaRhckiFj6Y4Jjvug
         Rsnolf3bZOeIXbZWZP5IAomIzNOfLBibCKzAE3Dhh8QNCgYwYr5XeMGPxScSX3sv8LrS
         Kqx7IAcwn5R/O+6WpLpBWetpTeAmfMF+k21IVld8RCoMgpJEZsCeBYZBWAbhN+SbuO12
         HfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835110; x=1795439910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2gbUgDpflbrc/m4hWyeER2/DcJMobhjIE5yYWx4KBs=;
        b=C4O0R7lwLdVPcAlBKmeaI5hGHs1arBNP+z70ZpGre+GsR+F3k8lEGHJkxlXyfHhYqY
         tbIB35omKC6Y0sZJHFO+zN5UrsGrFbBlrh85uGWblm+oUOxcSCNlCW6J7bSFcPOJh4/+
         upyFiY5hzCbVanaE8qC7YnSmmB12GkhB4Q+Gn3+ZRZVUsbgG0bBuK2HbR50ZcLqoLKWX
         oGSSql10iXwot+rzoSMgAmycd8UuraUsuEmFgjPgaY3hTfbvLL+ny7ApIEHSahs1SR2C
         QIUfBLdj9Lg2OkCDD3aJxBIgh7ENma1QqaLT3wcHDIu4hGjeG+efskGxNyU+u3T8XdOa
         +DTQ==
X-Forwarded-Encrypted: i=1; AL+hErHElXsiwSqcB8qYc73mn0OaZzjiL8N3hHbAOpXh6zByqJL7QwvYHJi/oeiYCQza2HqXPivsVU68yJMOymff@vger.kernel.org
X-Gm-Message-State: APuU4Z8uveh+vG9fnbBmdK+FkhS4FeChBFkSFuAYWmhapsEBqRS4kyf9
	Hpgb2LvGGjRDPnr5UbSR6w3o6mVkr/PYS8WpXhVT3NuApvSGM9adspaYN3+PKX+AdIzo5ZP/91v
	7LsarXfcdmsULNgV1BzT7Jmwu+FS46YnTo1QJDNqlFhlmGyH6m+UVZPJrzWTbIDFDjOTMgCss0h
	vk
X-Gm-Gg: AYBFou1ESiNh0A+AYAJOX4EbBJNqL39EyGjrgrdF7TrGXnGKNF3tnyIIhNPueHi8pxW
	d4xGukfowwmmbSBCkbYUJEr9RBDPpW5WCRxXXuAmzslDN3ehrOL4WaQuyXSPVjVAv3Ri4O9fp9B
	bKz9KHEHPVBhbifdbOwnjki46xQw4mhDE7zXvFdaxP8fxUo5EqOfid0BpErJ+9qyq4/jhkMByeP
	69Kl3/LfGjpdajJxMG6bJrXQST1jm1t6K10FxsPi2tVt4BEmYqK6EveEkdCjJRbw6zXeIIpUnuc
	4xOwjx3vKvddY//1b6TxAVg+9w73GedWahr6WSZpxoqHuwBiaOy6siYywFt3NkFX2jOdM+fkY5Q
	rXbnlS2LrHx7PDdOdEuL9A+ml0wffGCUl07ByL/dJDE4bLkU+nOzveyCpNqgsgW78jRpPWMgBPH
	RM
X-Received: by 2002:a05:620a:688b:b0:93a:2221:5460 with SMTP id af79cd13be357-9494bbe7d6bmr1466808185a.40.1794835109454;
        Mon, 16 Nov 2026 05:18:29 -0800 (PST)
X-Received: by 2002:a05:620a:688b:b0:93a:2221:5460 with SMTP id af79cd13be357-9494bbe7d6bmr1466801585a.40.1794835108814;
        Mon, 16 Nov 2026 05:18:28 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:28 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:47 +0530
Subject: [PATCH v3 08/11] drm/msm/dp: Add support for DP controllers on
 Nord
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
Message-Id: <20261116-nord-drv-dt-v3-8-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=1225;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XJxZ9JOwZTbboBKfrzjZDalKlNgV2kQ+8L218FILiig=;
 b=O6r8EyI2nMi9A+cCkAFWcnDMztGvOvMYd/RUd8W9f3dPKb4b957WRmfYDKWVO5OVbAESJTXGR
 faA/HpH0XxiBiH4DIZOdzsKAL8xx3dgfsxJjei+Z8ud1SGYMQYl8RGO
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX++ct1Iu2hopj
 9cBBrPQExeknQJvVe/w1ZV+P4pXVEOnC4oEyZSGZBnXcmJtm6u/Ax/+jol0xtQLTqOPGJNaowq1
 djVGTtVhz1+dLWSuz1NZpLIAnDHTwaQ=
X-Proofpoint-ORIG-GUID: YgbCtKwGKg-NQ08EKHH6PI62RfU9aW9b
X-Proofpoint-GUID: YgbCtKwGKg-NQ08EKHH6PI62RfU9aW9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX3oS8KLtYKqt7
 vn+Ab2IMasGd8fuY+KzDOA6NDz3X+ih1Sv3f0xhfDz0dVpRu+q8CuaatiP2bhp3wDjRZ8IkGpkx
 ERa2XrM0MFkUYYkHGHWHtkScX1wd0YClA90jdiYOiyr0tyoCwQdGFEmDhwLRdzTbWaeIcpYn0B3
 xsMWmllGkuoZIglSEnn9w2PZizluSrL6CKEV7cNPdTtbm0HM9crK2S/ohfVnKgglqcuPOi3S1z/
 hJPvVJXTzVqczculSbsWWlHHnuWqHF52GZezfSR2mPhE53wh+XeWA3ly7zFh9BbUYh2SLo1TpQy
 2cyGsY2MEl7B4Bqlb+2O9QC4Kjj+JWJG7HeCuYpBDBREgnPhJGGvUNktI7/r6dES6rEr9hO4aKp
 r7nIQrdKbiDs+T/tcpriN+FeXpWL+RX5jlssswyga5Ety8r2mLwGUdr/mdWZ3JE6eX6SGbjcURx
 nQ5Igq1NYFzff3BFlvw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afb02a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tTS4mT6h1kkz99yYBxkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord has two MDSS instances, each with two DP controllers. The IO
start addresses for the first MDSS instance's DP controllers are
already covered by the existing SA8775P descriptor table. Add the
IO start addresses for the second MDSS instance's DP controller.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..8b1b01af11cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,6 +108,8 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x08d54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x08d5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 

-- 
2.34.1

