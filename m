Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674740;
	b=3lYatY8AaZ/U4+CdGN7YMAW1/obXwB3cjXWi8G0GoevChVLwT1/ASjxgkVsmA4lNi5wh
	 q6wahEiyAPcxNuusufrfXDGp3gep1WRIShqWyNKqyIteW20Zlbr4S8M8xBoQKYsC46mB0
	 X6xlQqjKLUJ6yJSoEPh1RqlGuizYY0TUT9VJnP2dejUT7SUVpyc35pBKL+RTACiOlVTtN
	 4byFpwPced8QM0EK9SvItckeN08gNQS/3BCrobfZ/2C9p0ugTHItJMLnxPu72X82RaUNq
	 Q34er292aUvuIwqHMkfiU6ZRGhyP6WJg5c+y8Yxp+HUn7ytC5/SGRxQJuR+FS2rImUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
	b=nineQPE8Q8y+AsWBweyf1V7999BZHGRVdc9sKHVC6nsG82YTh9SFEd8drvZ4B4U141Mj
	 SBiv8xZFe4yKP08uIVuU3nl8+polshHFVEuDnarytjU/pmnIogViKJ3BOLdrLBGJZpqgP
	 xj8lnF7Su1AkriA2E0MGngswxIGFW6nU5iBartYqnCnjXcDYMf+dcb1B8kaZNxlB29WwE
	 amAKvT6+IzpoD5H4Qx77/+DI6SE/PiKu9ub/HrgrX0LvVma2LSCgCFNDdZdAPy2hVYkJ0
	 TaEshSG4N+ZHWhauJGmyamp3XmguAyxkCJCWRd1igBONhD7RwZ0K4e8KVDHap7YsmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W1x2E/qE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22866606A6AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22866606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1x2E/qE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36RAT1686573
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=; b=ZdTmBJzpsejhQ8Nb
	+TcwWFSNTj2fYAuNXt2Fac5+3/twa7YPJCacab9hyvr8QYfFmefKJnKxFnOH37O2
	fcHVJtUkrsDVIc0XgPQyPaeW0CsTQn3X3eihe9H6mPTbsJhjCD6gD+atcm+QiA0B
	PgM04MsCHdUudm/AO+rckGk5PFl/RdgF7FaTqqCfSk3jLkeogRAZ7nXeadwsA6gk
	DypoSQoT6dvoNhKo5FmOrwgCLou7P/J/B/DbWgzq34Oybc8PkAGjHQ+dzKGlnaYx
	ttPLSgE/QxIy9SH1kT6l1n/CQm9PqDcJv5JPVVYoanS/ho3rTmDylnmmOTgu3ZKc
	PIyMPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9kvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f03a137f6aso58560645ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674738; x=1796279538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=W1x2E/qE8LLPjpaG6TcgFg8MiWwTPQzEBTJjuJr0hDvL3/b85+CymYDhsnBYPcor9E
         EDnWBCCXaltY16cmA1U81x0JFdzr3ej9ee0vXxGoCoQta9VNcV2S8npdAZG+EFAKtmC7
         KssiQn5GsSVJwLTIKQX4q65h5179h4Rjuy5Ssr2Dkn9ZzrSNWw1Dlaz8OwFJwFkFK0Az
         sUSRyp6EYJ3DBKk9Um3SYJ4UTxtlkOw3RGwjwWwAoTMEvbtk2JRkqdsjg+5TJBws9YAv
         c4F6U2CDz0a0nDbURAjcBJVlYErl1sb7egtlk21Uek82AY63ztFaEhVSDj0LB/UXuiFb
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674738; x=1796279538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=RA+jY6Ske7R1UT8TM1chyOcxKc9UG/+SFrp6dZAsjsUkk6CGDEkeMOJuZOlE/vePGQ
         NuYmNBa8xiWm3cN4ToydWVd33pFD9r7ZoUl02LCCZ1cF77oZOBSv5G+/vfWfhLWswUZV
         ytkbBKYXa5TfZlGllGhPqfSZlRRc6Q1jKnW589DIUI1b+miqErAzxx8fNreEvQq7OEl/
         jO4GBN7NZswVzO9hLFRtLrju4/Hqz2VI//E/pwhv79KgfBA1iBVUWw1V1ePEIHv/iFnh
         wgt7RKu0ZHWd1MzPen2CfsSdbTzGCHMmjTmZERQBlSaGZWHelxp0rq+CoytU2Qschhos
         s94w==
X-Forwarded-Encrypted: i=1; AL+hErEVasG6cbgOdufkaIwuliU8nChR7K4dPEes9G8VPnMrL3sBCmBqshGJe15tAlAaEnYTVvEm8jfK9TDn3thE@vger.kernel.org
X-Gm-Message-State: APuU4Z9IF0gRdH51TEhDLqU8fq/ILY7aH2YZK2FAY9OlprvG8nzc5Y7O
	1TOWFYQN8C1bWi2d2Jfii/sRdoq9z3EPSXuAwBbIitQv7U3YZ9qJCM4vXjPlog3MfUILnwiSte1
	MfwTVwQ8CgNZx8iZEz63YuQJ+3Dbj9m6Z2u+E/MsjdZXdxRC9i0rUqzMNUpnxqMdgLd7o
X-Gm-Gg: AZFdTZfgoHhYDlp0vERdUifTK2iH7irTuw+Pn2FXx72e069+xIaxe15wHkPKZX+ePU8
	a6UgjO+i7NlPUe9XIftBXjarmSyeWEDkjluX2YTdW+XxU8RUoW1UCt7CYwGx9tMjN0YO092sp15
	vdBbQmVaESNJbkfj4rxc23MxcsdvqvenhINj3LShBLJzpT+r0XV2gWDtVbGnZTgPowjtafmYRoj
	mX6pdsWRup/vItWFxpRXvrB4SEv965Ynf9Uig6uCNCzvSSEeOc3ATRf5iBSzoosc2w0oW7y2lEY
	ifp4FNbk1rZNOMb3F64DLa/Vee48+ox4mMz6y8fm/4lo5no9vfzL1z8pwgJTC8/PTM7IPNL5EVG
	Pdzyzvi13LiU1JNNEMmSBlaXLysC6qnYX7pEpZ2QaF22YLDYylOt8AaZmq8Df6DXl5NvU4JfZpn
	ic6XUUZXsg
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18249145ad.54.1795674738128;
        Wed, 25 Nov 2026 22:32:18 -0800 (PST)
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18248945ad.54.1795674737658;
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:28 +0530
Subject: [PATCH v3 20/21] drm/msm: Register the DCP backend
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-20-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=921;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=6PWxDVi4BsbO/741ftQsQBNSZTnRP3jHkckpMt40Eso=;
 b=Wl4BjgymT1IPugnivQbz8x6tsQhKaYhy1kx4zbGuLUWYteGkdm3HxalR5HeEUukju4cP5dIWN
 +kl35YXB7zYAwa3nkmZqDOH4Hq8/2VZ6AY2DQkmg7CXkeXse2A2DgET
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: FlaBwUTkQfgAHDYX3Cj2OXh00TfiA-YB
X-Proofpoint-GUID: FlaBwUTkQfgAHDYX3Cj2OXh00TfiA-YB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX18PzEnDS6pnt
 LD6tLLAlO6WgwFhH2yxO3tJWCz/iFIrtKa1C5meMoFjZLbTrcoKE28wAom3jJd6dhtNolBL++/3
 Ej0iZcg4vKm5SrBvgXxHZtU4Ml5tJ8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXwvv1/eH018Nk
 5L8XaSXHkBOyy1QVWqVonJODMSw8b+ObOsng5pIxIB+tUryotO/ybII1z55gFzIX7Dsz5uCSKsk
 HcQshsIy8J+zjbyF0SpLCPmKBSBWpy48s17PSRcOB03UYitpfO6A0y68TXY7sg8O82psmzPAxeH
 2Ai4NEJwa6nMpnbDBMnsaYCNT+1oIgHv8e/s8TU7AT3qiHrW6ZTLUPjh+rsa8XXca4JLzV/8NOS
 N4KziTD5RRPiiyMBQ5JzylQd6EfllKKFa8bplAu/oL9r8YAZPNIKuRU7irJ8w77GahlZY4alIs3
 b36jiPTMOP5kKCbEZQp7IVJ4FMm0r/oKpLsjQH/jmVocAd/Z4ta7wDnnp1/hdknTlE5utT241vF
 DyXvpGSivtP8MoOwwHt42IRwiMcEjY0LUWQBVVIlfW5wpRzSiViX9+abwn3hJlbS0HCtcedtOqY
 aIKbPkafXy2CrTU/7ug==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07d273 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BMemq1xz1GlmVizxLk0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP display device is discovered over VirtIO, so the MSM DRM core
must have the DCP backend registered for it to bind.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bb383bb0fe8e..af95237ac872 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1209,6 +1209,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1230,6 +1231,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);

-- 
2.43.0

