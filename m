Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A38481FD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390163; cv=none; b=N2fH35uXQexgrcwqai+1vosHKiuquRfVKyAKl4VmqP1bYwrB7lrfWk/8UZB6xP1v18PqpvLxJoVUmsyF/YVm13Dj06QXF9UrHIK39AJ26f5pMeK3XUK7gLjmKU2ThT9gScY03rGUYcL5k1bjsz9US7eniwV6R7tMUmM9JKwmX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390163; c=relaxed/simple;
	bh=bSwOuS5iyvqMiUoi9APsbBdLW4Za4qn6mGoGPuU+9Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9IVqcQIsvMXd6DExDe5kYFu+z6N5/m5NfzSuna+jCtmG5YqGvNQ3IkjzEyQcOW+pkBPx9rBnyz91FJ3Ss+WAznd/bYKvGF1aBrcTAa+K2ryRp2MHRJsGg2vgyw4Woa9t45EqxoSYR4LjxRpxCMv/DYX10bdyB9kGpALr37ng2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xn21/ko1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG3hr+6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xn21/ko1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG3hr+6R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwTj1460502
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=; b=Xn21/ko11z6vy9kf
	60hIP0+PfXJ+j0+KNFOZjf5dxCoElP5mR2Ahq267QQe9mJKw0s9Z1wMKQVcDWEXW
	5/209Ig41xjrX1j/DeWgelo5koPvg7H1FbjDtLMTYchzIZUDyTfYwGwShKl/gsPC
	UQMZDS344r7Kzw00ovJIIwrnqfrT8wKykTLHqn5FGo1CJOs2TaTMTg3pb3waDob9
	s2ysSO2alZNi5bEEVjg+AIQRhGApIAN4UpHMcN8Jb2l/Uzi6ALAzH8uLBC4Df+0Z
	JjL4oRw/ls1eQa7Kr97E78NXTrMYLFnBi0Sqi0TrLLNOKFkPhWXlrFUUqWc9NeRB
	47RJ9A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9107002647aso40573736d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390160; x=1789994960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=;
        b=gG3hr+6R34itaMZthZLCjfB/9qEU6zBBXy2KLX67r+kMqczjhhsvJCGMcxK1BPxBh3
         VAW9a23E7YgDqMc/8h3+zQHw/mhnHKLo8RRLvaZCqlC2IKgIZhYkCYWIs37prOmf2hZv
         9bJ5br9ltFUdvpnJ8xiGiRmexcyLHfcFf5UGNy6yv9TcCQJdcrjVygOCt05ysarnTwK/
         S2ASF41/OdVbqyzzjhT7xOvSdIy0sxjZlfQEs2SasXSVzbfQFAs2bHzXG9v/uzzet7nD
         OPht7zdsSpKOxYHjUq8u7Mq884ncXAKVB4h7ymtxJlglLh7g+iIxt5Fdpw4ZuMN8f7wn
         zDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390160; x=1789994960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=;
        b=MyXHyvCwT0UW5obDcMVtTJcLUTD2gPpl+k0lHxNaM+lcOLPZ8DK/ugscytEN1PTxix
         kAX/4ELLp+38jLOKt8vDtK/HjQm1088XK0lspjY9tkzjDxamFQIKmecKlSFM4+h0y8W0
         t++vpYKFhEOIf0IcCyvt1aToFcS49wTQtKnZzegILf4/Q8/3SWj13YeCiZStD7AYX/Ac
         ASZ+1eWytvCTifY5aZcoVyaq/pt7hv6GOvWLYTFHiPRV8w5ngvt9Ns7R1uISk+7zb1la
         8HdvRNaM74HN45mN+4rJn+gzyuMIGrzHuAByWh38bhbUqWE9jgU8fB+tesuLK4rqG6V+
         W6/g==
X-Gm-Message-State: AFuF++nw+26vCvptm/2MnPear6rPuvfxus79eX0AUX0+IJcvMyETrizF
	6cUuUhs568kpqsuvvKYnmFqgCom42djDqah13zr2LgoH+YAHw0TVWwRs9HziUYLHaYDgHsVtNli
	KAJ4bmOPLztoQF3nYs9DttpirP7jS0CcowMHmn7ddjKKjNlWZhacMp3XaOU9ADkpGVLZG
X-Gm-Gg: AYBFou2cizyR0H46OcHcEweWTq1tHFXeLhj42tCyI64gMR7kzI2o/42FQm0GS2EPb6g
	lVAI31MmhBf2nKfMKmm3yZJf1KIF3xEZkIOp6tnTR/pdwz82wzE2BSdFqhb81LrpvnTLAYPK0ty
	NLpRL6rwP/TUxTbQBMopk10g06ANmF2zPZQtWd1wGtjGiOe17bxR3nG7Rzdq0oh/3j9retf2hUr
	lmNi45nJ5AwH+pdD+PPod6QcRfto93kAyhNr8IbBD+noK8l7AAG6wqTgP2nfSIOKfNtTrrCzasE
	lnJitJznEfQKkr3ek4QxkcWYy0E+3POpexpipvc/rcpPMtDgnNpMnPtXSpnuyQ/gyKNEVLF6T01
	TrQOUp+ud
X-Received: by 2002:a05:620a:640b:b0:939:8856:d8d9 with SMTP id af79cd13be357-93a29a9276amr330927185a.41.1789390159886;
        Mon, 14 Sep 2026 05:49:19 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:8856:d8d9 with SMTP id af79cd13be357-93a29a9276amr330919185a.41.1789390159237;
        Mon, 14 Sep 2026 05:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:28 +0300
Subject: [PATCH v4 29/52] clk: qcom: gcc-sm8150: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-29-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSwOuS5iyvqMiUoi9APsbBdLW4Za4qn6mGoGPuU+9Dg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+znW6Errrbb15ecOB1xlArvCoe8BkaBzB+1z
 MmFcQVD1zyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5wAKCRAbX0TJAJUV
 Vg+KD/4+CaFLgblKT29mjV2uyuZemUa6Z0CTNXA4rI77KK829wvfItq9BQrhYnieXJ3Ib1df4+n
 uEQLSi//yKAEuH6CQwC8Pv3mga836106LUcPOvgDOBPa7uJHzNKWuQs/HlYv9Aau3WaxXeYtfil
 Sx1gznD0KByCaeGekSEW9bWfkDmE/FUprgnCoymBwnuzbuB5R4xjGuvQ0O1nXdxV4D1vZp0fAAJ
 tPHptQzhNjO5sGFfo+AlbsFpU/Sd9pnfZvbDDVkWP4Lw2q1L0R+II2Q/P13W+IB2pjKUYCofNpn
 q9cedxiRfiFoZOZmwFd+11PlsZEiS9klOaR74N7dgFP5qCB93ERoI9SqAz65d0AU1nFSFOE39Df
 miQ4cBn+YKQj9RczeSznOPLPg/PosYcIl6K4aeFmZRrB8gWn3aYo1NTh97FvtkEtcqfnSra0QM2
 oUuY3eR9XtJLdEIB2CQo3ESyLMDFjNJ4rOZih8ZzWZ9+tdlG9ezxkFapru57YYH6kkwnI5kwK4n
 9QFICKpCjYkklgGj/ZKxBQg8qlYleAjHCSl2KiwlROtm09KWBIH0g0+Cu5QNO2HfLw67dglzk6/
 5kMm3G4+xlP2KdIf+tQA39a3PKzaKsba1KbJc30dhk8l16Awj7M+k5t392CUjRa82E5/7/8+0Oq
 B/qZZYgb21alhfw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2Ob8hw7fIP5u
 PuY7vHHdYpS9VGiJF+xlDVhyIUdOLlVzf01q2151CcPBLFLbH3zn94JhvwrL2PMaaTZ5YGTPPJ3
 CEOT28CIKX0ge8RxoXt8IvhRTngljp6ROmSHNuvNZr+DlnA56V7vgfycTWKkKHU9QICYCr77ph1
 DqBK7Ho8Kxz6Kd1YxFbObN0EMqKWFJ4arVtTlHXRsDy3etr6h8tNzEURTyMldlKlW5pNTQLfdl5
 frKdyaXoSmPeG1Q/zMjGWscHy/Jmzhjk5oqVs+Av59oxySWUAe0Nb3bkQrkWIA9ugAs1Akcs41o
 lN9BGdbZZMVNCRlFaCqYlD82HCuzYacKdlDrGnP7rA8uOvlJSfoBJ0kcwkxGNNK8YgR7OnXuYDP
 4TNwIVSWvTYxabIMeVDoon30NyD3fdtB8baGTLgFv2gfN2oiMh6B49Z1YL324pmcpPzgh9Xsxqq
 R7ebWppLW1axJwL4FXg==
X-Proofpoint-GUID: vutlcMNVDHxHZ-nSOS8hgKnggmXYnLRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/NZjocRhQxEk
 MY4pUzIGoP156CN0xtB4uvO5xl94l3iDKZ0qP5b5rIaUwpV+ZGStUaF3aJ4qPCulVLsUbu9JX4w
 D61JR3EJHQJ03uymZm4XNN4WlVzz1jQ=
X-Proofpoint-ORIG-GUID: vutlcMNVDHxHZ-nSOS8hgKnggmXYnLRE
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed50 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index a93d1f412a7b..1404996d33c3 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3771,6 +3771,7 @@ static const struct qcom_cc_desc gcc_sm8150_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8150_resets),
 	.gdscs = gcc_sm8150_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8150_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8150_match_table[] = {

-- 
2.54.0

