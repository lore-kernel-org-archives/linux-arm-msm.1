Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808697;
	b=oAAqVPqVHWoiZiDYmfjFuh1JUGM6WE0y/xhAcnfixHmXphV7r664Pmrn8q392Z8N64F6
	 a8eRimaSwfP5lytBRTCA4eke7rdClFKybZblz9G0r58hI52km/khmEURGyJg0ddpjvez1
	 ORpAoGbtALCX8MmWiOKNfOTpg1+/GQalvwz8WRlKSK4t7Osugu3VNAy3f0UwzpGMjqir2
	 UUBGqk8UluzcmPZlG4lzhMdO7+iIlzkbIbi5s2OPwQUJagoFLLr80oUq/C6DuAknXjmW8
	 FAz7VSvhyRL8Uem+X7wgfKJIB9kd0YfZhvNDFaCEnWdBpCAmKpqabrbUTaOCmFh6AhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=;
	b=EsGUR/1vg5+qKi+mbGM7m4jAAXa/9aj/e4V4hsc1avWHqcXbG9JKvAd3HCZVF40SVQPF
	 c1hjDORZFQSA6hB+xA8dav5eScAVQWwJxMfLKWkDUzG/OipnxfB7DZJhgiDCe+u6WZNHN
	 NDbYIjMI+ueLLFLCiQTgxCnyMSmQBh55+NqMsPBwxu61felsJ58Q5R5P1OAgB5KUjyJv2
	 7cK1NaFfY/LyPVALSAedjliktDiHZX3JCfg+41Eofe3dIjtpXuucZ18Q1ZjwwEgogy+uO
	 M8W/eX1Fljc5FgWXwrMPsAmK0Ydp4yO9WyTG/ccHzaOcAoJTUNkHhpXfukb0cIjYPsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqWo8qaZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DicMy8Cq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECECB606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECECB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqWo8qaZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DicMy8Cq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAv9o1127695
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=; b=GqWo8qaZYfn4yRQA
	0SGjzcI3zqE5FZRaIi9toF/tPFki3DTmO0n9y2R9mdUJdIN+/DqK/5i+pbC0bpt1
	aiYdJC2pHzgvjLn4Ujt9xWiuf5BFtUy0BwO/J9gLKYG00E8secfmx7qXN2ZnFbPh
	syj1WHCTw7hHlWWAIShpt4X6UmVU09TV6FULTeId8qMzMIG3O0QV8hWJJVcTUzb+
	A/fxKLTeOHxxtA+fGQu9zovUjCTQ/1vZp0asLlamNPMHl/kd5nsjabrdeJ0pUP9c
	dnLRCLQ8p1Smkzl4zDbyK6g6FPJLZRU0yc8MpaKG/76vSjt5lRQnHzwvE7C1Et2D
	e7LllQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6trts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:44:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210a12765eso123934586d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808695; x=1796413495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=;
        b=DicMy8CqB9+rA15w9vAS3+ggFx5RSDuuSV514kWl80HDFTU86IKfR2zZZEJeuGztv2
         X+dg5kJJkyjx38LOU9e6VR56ikU1SpZFmEpQGpcZAaQP4nWs6FsR3xe7hh0gDXFVq4jx
         ASspwNXRaJCgOJI/0Dq6G937RpIl96SYZMWdB/PDAR1JrkYe+uCweh0mhAcJmAi7YOp8
         qldc2o5t4w4NxbSv4Jy1RHKJTaQ+adj/iNs23oo3G8XZGICYz/6bJfNbuzM2AYDdk5XX
         f/ITuFbfvdrz111F6RMNmgTzG61DYfoRH1pZ6C+7TQquwiC8klImmPejWV190hDSChQv
         dc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808695; x=1796413495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGme04KE8YTGTv4q91+XAorU6TR68+yXxNUbdjuMex4=;
        b=oyTTBxMVDF34X0cF2jT4tG/lQULNDXPLReo/MME9FLK5WEzJlXgvOnvCK4AOYOL2ta
         FNf5gdX2YqACZV/SkBkcjs3L4rNCU5cbN9WlPx4blWXFWEGNyZzNKsoGc76yb7iCW0ks
         SwTNsiRkSj8VvpRRA7EOmco2Qasty4RSo4kzybgSvbsBEg9bbmoykwzywyxZ2FPaAyci
         sWcSN/jhY0E8jJVDpW2RClHl0p9JumhLvs8Vu/NXy83ImnBxU0jlMprBvCHBoxxlahUF
         MHEU5jgRuSBDH6/blhdC3XrYhTX2kf85wJ0khloNv/2FjfVVSIFF4QkMUueP11M9+eiu
         qTOg==
X-Gm-Message-State: APuU4Z8NbEn0gKeB4OOZOx4gJfGVANLevN49edTAZQsfUMRZgtm8HskJ
	koaVB9OnoEDzFZefugtTMb19+KALNkH5m6EjIzb/8xitxPoUZ42oOKn3DbdybLt885lapoHXVU7
	NdyJhwwgILU/pdP8eXhw/shTz2lVEFnsHwtqgWLKGtRu+6lox/HbGXv29MO4qpHRz8ljg
X-Gm-Gg: AZFdTZdUG0FXnSJk4D30WEn6G/kko8lH8HqBNmbOOk6lG06hFp782PlnCmfcCjshNd7
	hGCIflwkhtP/PNhtMo2C0zIswGRTyUBiCM4n13XRWydpxApoNBZBnpP12dq9eynpiPHxxtWWvi5
	SXEpsx4p98r1CRhTj/toTSu3Coe/81VTic/T4dsDZ4C9et037UXdD2/NJBlrlfm+awujncEC60k
	rilpPxWlumd9/7G0cWpKFqw9UpDh+rG/WOVxzncXEFnPF8b2POgZX5PbxU6Og9Pp5S6amQjaMFe
	/GhrpHhrFiYs6Ei+udK80nzzRCcEq1JjtBGoX6egsrXA6n/SFbjZ34OcltDkBAi5GKI7/7XiHaK
	rDTIdQvlRXSNaKHLYz/mkbpTQpK2rBt//xNEJX2DSFRf7rzdwcgnu84Y5nWg8l8gKvpqJS6lXZw
	k9/LwYqaryozJhMTFQieqNGgcbmm5Ir+x0OSDYD/clVIdRUJBV57hvYM80DJ1AAw==
X-Received: by 2002:a05:6214:b61:b0:921:84c5:8faf with SMTP id 6a1803df08f44-92184c59c32mr147407136d6.12.1795808695178;
        Fri, 27 Nov 2026 11:44:55 -0800 (PST)
X-Received: by 2002:a05:6214:b61:b0:921:84c5:8faf with SMTP id 6a1803df08f44-92184c59c32mr147406666d6.12.1795808694624;
        Fri, 27 Nov 2026 11:44:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:15 +0200
Subject: [PATCH v4 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-2-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zt/mVP+EEls9bu9ax6mLMV+QrjhwVDSTay40Fi0xlRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2Y+qlOF2bzSiezhCw069vw/eQH7bU0nBtXb
 AWxGWeVFz+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndmAAKCRCLPIo+Aiko
 1b9UCACQSy/DTtE548PmRXUW+SXe3vPi2keoae+ZS4SBpoX0+8poK9Clb28LyQzXIJar2a4B3uH
 82h77UBdOwSvfxROtGqpfdknQ7K9OrpIE4lbaucTHfViwQiUbw3IrYHADdWN/OLxGyYLK4GwjgB
 VylpcyrCWHJ059utiHpLgwPbIeH4SC/KDqCZKiw5yiC7rzXFNFcrEP2XcuhLQt5RJO6M7aTp/0z
 JCcLIXc1Wb20zcSUaQ9OmI7192M9HvcsbuVTVixd9RBSTEbEd/K72ASYbYpezLtEGuoX+AL2g3K
 D53zUDWmXrrMulkvfkV7u6/WQPggz75QGa3c/rOvyD9DmkQC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5RV9rgXhUtUorJhMDhhbGFSrho3Fq2if
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09ddb7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=X8-H6Saci9yJdrauny8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXwL95sNyUicFq
 MQdM2LEW2yDaIxKaI8GyJ6BOSl/d9eTG+uFgZRTvWZxDAYYSAmTGVGlcpvGq9uwGRJBkcGWOJpb
 wyjteJgS38vwJdwTF1JBmT41U5p83yk=
X-Proofpoint-GUID: 5RV9rgXhUtUorJhMDhhbGFSrho3Fq2if
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX2enF5Nvqn+cW
 MQjxQ7osuuGBN1c/g8jwZyE7av1EUlE+7DgUQ3EqmHAT13Gqvl6G33hOGHvdz1djo2qr3jGWsTQ
 AkIDdBz1ON92C7GP3lgmQnimW9PE2/tj4aEuhh/NjKQYNlnL9u392J2/kveRxSiw5zzztmDpC/A
 afX5KVzqgGK3KrWVIHAcyEKGceC9MMlHfflSW28RpcHsndYEsoL9+sWmVMU/2JJ4+RuK5laiaWk
 dVJ5Yrtmu3E6yPHekGvHksary1MrQsUov/gD7W/dEajPgVIbZqTGDIzTFguhMfVu18IMgMVE5jc
 aZuQvfcD0/v3zT6kNo0fbGyeeT+N+WLOBSxrc6QTMDh0JuArwLQUBNb360MAY4up/1u9BN2DAIP
 o8iIgG/C195qvir7aVbHIsvK2czIIIGWJMjeqE1rEwjmC0118KkIy1kPRfVtnkoe4BhM7eB1dWn
 Q6kFEc2Bdq/hkLN/O3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

Binding the MDP5 driver again, after an unbind or after a failed bind,
corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
oopses in hwmixer_init():

  Unable to handle kernel paging request at virtual address ffff0004d411f9d8
  pc : mdp5_kms_init+0x264/0x7f8

Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
but hwpipe_init(), hwmixer_init() and interface_init() still run on
each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
without resetting their counts. The second bind writes past the end of
hwpipes[] into the fields which follow it.

Reset the counts when the hardware blocks are torn down. The blocks
themselves are devm-allocated on the MDP5 device on each bind and are
only freed when it is unbound; that leak is left for a separate change.

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..085c23820f46 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,6 +570,10 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
+
+	mdp5_kms->num_hwpipes = 0;
+	mdp5_kms->num_hwmixers = 0;
+	mdp5_kms->num_intfs = 0;
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,

-- 
2.47.3

