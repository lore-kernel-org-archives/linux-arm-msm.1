Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717819;
	b=t1gF2fE6hSw6m6d2V9wCT0WmdoLKSmkE5USTTx9Uj2Jk2bCHoGTMqp1rHCjrWDSB7/xr
	 LJqGoXDUl2KiVWPDneQxzpjlzMuAcGne/Dft31mQHRi4h1Ju3Ui4YEf4d54CYH3LHs/fU
	 3f6wJWrSxBbSv3757PZzDOTJqGKjZjz/pcyltG3nc9qCZNpldR90uFT0AHRhDkKMchhAR
	 7t5tSBf83IgPPkbXVeQ2zSbNC84nV4aE20BCAaZxT6r+7SiOoEOoRUrVhMwxSy+wqD/Is
	 xfM5EE0J6R78GCfrmGWG1tzbxtJ9kq6Yd9pWwuRPDUks7uyOsB+ScBmokV/09laJUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
	b=RFZi4C9GYFR0rFN8cSy+n6SwdAQOH+Hdxt4f3IaGZrcuJQwRSkkIieeis1qEfBQgnSFV
	 SxJnTbk0uyM70TkwXtMwjPQgsM72po6MUhPvMAZlv3ns5tTrxG8bH4VprLZo9w0L8FaqJ
	 flDm1unwrwLzyJMLpTCAfR7cyonEeUSSNaFkg6Vprto1dro5aZDETIMKtH+nGgo5gm0qT
	 6Hdg3WDecjLo2brX1sTFkR+CI3/6rALFpUVSlWjVwLlkZyRLPtyddy61rPlEyILY8zvyZ
	 AWxgNLCemtAyYf0m6pd+kfIc9eTMC+1zqzPzMTL87vBveL/Q9kXzqdiwItQkoxAzuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7cpy9Tv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KZN0YW7/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F776082BD3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F776082BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7cpy9Tv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZN0YW7/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9uRt3657416
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CxRFMAsJ+VF
	JvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=; b=F7cpy9Tv7DXa07GrLaw6XePHHgF
	lr9TQbW18YHBYVnh2AFUK3o3FUKk7+AF3BWZmPfIMzjcf55Gh/B1hoMSQsX7IOM0
	PABuRBu5wNHS4JdtysvxjzT54w/5lW5+7kDE8k+qfM+zRjQ91PqnsAGUyoCProsS
	MqnckyTvN5US6YY9O9St5qDpqfoyMypLS5qZn0K/Vha4aX7k9eSacYF+JEsRfUAo
	mhuqyNcFYpE8Q74N1LfGfh5psh8B5Wb/nYuVp/HAc7VcFRlaiDrj/RVxMGtiSdxj
	tD6tq7MCFVcFrrhmVIIGFqDpGXnnVe+ojkEiM2W/p/85m5uabYn4DmeA2ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ct96k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:56:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so142153685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717818; x=1794322618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
        b=KZN0YW7/f+2Y96RS/pb0Zczi1DBZkMwnJ7PEsW3IByiLmcf+EC38QZ7R3qWgYbFv/h
         PuyGuGd6LoFsGsIn59FhPP3YfF/mpKg4lXbSigv7nsZqAkcEgk9iBb5qvj5mazIgGtm2
         Sr/PE46LEOCRVaRVjkahjQGcNXcEOucariX56dRxI4hEe6Cb4sQDkALquMBdmrI8ZHuQ
         +v0A38jDbI7md55hR01yOzKjDQK0coocQhHzSHUAdHF9wgHlgn1W2qaXT9WTu2+G58AD
         LimdtF4fuf8hWyI/g55SdGnim4R4Ac/NJuD7e3gFsiPGKnF6wf4gIhPCkW2V9dFpo1zX
         vTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717818; x=1794322618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
        b=hZkX2qk3DS3QEezZKuZDpBlus8/1TM2ws9Mv531D+5Wyk4+eKQoQzqe91r1X4abTGL
         qzkoLJvVuX4PDHETzFaKRf2vQUYtD3cxtqY0ZSY+3rhBFZMoG9BEf1V+qcMpXEQ7jj7c
         9lwA3Fy33pdgOUmRBO4iaglcS+FHkVwsUhBeCylO7gSc4ftspIM21aKdHZcxlNXA1S2q
         wbpvIYdNElVg7Z41yEDWX/g9vhP23WDerXMblUMjXdPrzkYt7uTbVjB1+6J/6axrukwp
         q4zhwmZUtoK04vZ+2Her92DWuxVWov6Yu4E2SlQ2Oa0GE8ydBuDDFK/5wBDldHcn1N11
         4hZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgmucqqMj4i195P4Uvos9oh/PFb136aS/kJn/wP2oG/mLzxjRxWEL+XNiWO/GBh60BhCXkZtzrLeG9NxVu@vger.kernel.org
X-Gm-Message-State: APuU4Z/TpFBfTOnmG2MRt/jKtwYaNiD6rMcBZCOKyK5HQeyWYZMWsqjM
	pTFMp+Y2r6RgIzETXFmR+GeZBeB2N1NpnICP5GXse0GOxTFBsh1V9DDx1V5ijw/QsHulfOteDGq
	miBOOvICkD4rWHRSGE4ydvRhWvpQymnMtKXojY2OUmbme0ewZ4v/T/5oJwm3Ot3b+NSF3
X-Gm-Gg: AYBFou0I4qEhw+yR/AFhDaYYvukBaAmjWnXCJEIhhLx9QsWCMPTV5EKc4540sp60/IZ
	I5nFpDLsMav12TokmBojVmTjjdCUHYMUqP2upVafrZhBfkDOqnOfKEFjKVW34sFJ3h+szNQTVhZ
	f1c3n6v6T4GyHH31nwKXl+QHhZOrv4QimAwVqtd+KI7S8Y+1QogQTX5tt4Chvyl1BEUktAisgM1
	DTLN6NUlvVzJPyF7moLrABeGSlb4SPGWoAopk3h5mcuHo8fXFy/omoxHacSBEUfAoH5n8JU0OG/
	sJyYP9islqtFCHH4E+FeqbKcHbhqgJuU0qYGrOdVux0mGJAiUCQC3GiZAQ48pVrHNxD/3Uibtdr
	EH+d4D6UezdfJniE7GuYjQvTa6YmqQcRmuzhjwb6YTG6XHAbOOeTDKnyiKqidwg==
X-Received: by 2002:a05:620a:1b8a:b0:93f:36d8:5334 with SMTP id af79cd13be357-9441338900bmr2433456585a.21.1793717817676;
        Tue, 03 Nov 2026 06:56:57 -0800 (PST)
X-Received: by 2002:a05:620a:1b8a:b0:93f:36d8:5334 with SMTP id af79cd13be357-9441338900bmr2433453285a.21.1793717817213;
        Tue, 03 Nov 2026 06:56:57 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soc: qcom: apr: Narrow critical section in error path of gpr_alloc_port()
Date: Tue,  3 Nov 2026 15:56:38 +0100
Message-ID: <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=U4DKx8MMiCRhcURxj0s5MqGMwNt0kESinKP9ZIRoZRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYlmtozzSuoxt4g+Yf6h4QKEby6PWKuCSTiU
 M1iNwDveb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2JQAKCRDBN2bmhouD
 19DyEACOlcNQpYZmE9m21aYxKuhM/A175nzFHKe4HnXyq4p+l6crVJ75W9HI0zhaRmZqciuGpFA
 V20iscomAfrOYRWUmKtrcRL/OusO5KF7dKsH968V8UvqromAv2eXV+gvS0MWawvwbMuAtdS9Mhd
 h2vbAJue3kKjt4XMGN14LLAO55BqENiDHcI3tM22Gc2XlzyRIbvdBd+9O5IFaQIbpEuwiGixGpM
 EN83+bblsAoHimmMLLoLgLxhCr/MbQ/Fdn5L2Idlvwmnq+9J0En9hdpg2UKf1E/Vmtl2SfIAcOi
 we3hobgdwVzLLgqrtWi9OHlI51dfIHO0WQZYZFbQewSHcZh1RhBRUPsfx1Kb/gHJ79fT2UEitMy
 H61MSv0P3NuzaEQZbZhfEAUHfthokjZJ7Dclpj3smthNjYesq9Oun1DRLLEguGFS+/Qkrsj5xvE
 ZxYMnPiTEQKXiu9NoS6M4jyQZUQl9UZ10gymoaK22F4TyWlGRPx/Q3orlsOc47G7URkVRhGsxOi
 H2Ru62FnxJdPYnnEQ6DIhLiUcpVipfOVL5Y79EubVy0HfPdN69EyC7DrMRiRkUKqNsPNsq0o2EM
 Qx+4FfIdbYunvzMvn+YMoVHPkyBppxnXgdm3vWDMqJqUWFxmE4CBXOLJxNS89t5WCKTou6wR+bP zyW642TPYGaKpqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9f63a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=M4xG5xDUUUIxRXP9NZYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: PbeljfgtuZ_AoGjfXFCa19vo39xxmf4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX6iFQb+Aw0Ykw
 mI2rgsLgiFyihgRtd+Qr/7cMj9tk6bwG9+Xk09E/frYDdFWP2GiTbv752L1wnAI4Mp30IUa+9zh
 +JVOUk2ThyJ4Zu1qjdw2HRnmn3971VQKVx789wuSpmt0HT9AzuyVwO5QKFDv86/aRq6ICwY9ljY
 FH3cvcl+noId5xFqvz6dsNDfjOCsg3H9lpB5df6qCH9FgCi+de7kO1p+misOnJeygIwcp7i566t
 UC4fs5FUzycHaH5WtFnHQPbam6YPSd5Z6Tx9LkEzegB97RpBZ9kwo3/TCXEjfAKwwMt/gI4Mokc
 1Lgr5ex/H84INA3X67EAVP1J5y2Iydg+sakPIqVet3+yIdKywO7xcItmGXndSnW6XG5hV61mDPT
 GJVCxnxNwvW2Ccjxt+AiUBUNMBxfEM6e9vtbr9gWF9PEp83rr+xV9gTe/AnDzvZ1OAN2hfbaH2y
 Ghww/XJabMy0GhDAqkQ==
X-Proofpoint-GUID: PbeljfgtuZ_AoGjfXFCa19vo39xxmf4R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX7ONz3ZUYfvEr
 TyyT2LpUK7CAtP0gfiuOg5mtJZ0JttihxrNDbL7/5bFPha44ZpG5u8qDp7PPTATgdoLeF0T7qri
 Hs08y6Nm91Ri2j0BYUYid8r8mk4A780=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030059

Error path of gpr_alloc_port() can unlocok the spinlock earlier, before
printing error message and freeing the local memory, because the
allocated memory is not published outside of this context.  Shorter
critical section makes system more responsive, although gain won't be
likely because it is only an error path.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. New patch
---
 drivers/soc/qcom/apr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 80056bd0686b..edddf473943c 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -117,9 +117,9 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
 			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
 	if (id < 0) {
+		spin_unlock(&pr->svcs_lock);
 		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
 		kfree(port);
-		spin_unlock(&pr->svcs_lock);
 		return ERR_PTR(id);
 	}
 
-- 
2.53.0

