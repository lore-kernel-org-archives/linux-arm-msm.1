Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1E429014
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440221; cv=none; b=NuFlsdZDkqs77LAWJvg/k1tvBGwfZCbqdAd6UAde1V+kWwEZJVuH5xzAcLGZRjPE1FwNOh6C3BmMu9856f0l60jLShCa1jo38cmt3IPw5fiTOv/gATySWxT9/9aAyJOKmWrxBb/EQa/Ovn6kCUQPSbn81Z2LZwSbQTwPrg904BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440221; c=relaxed/simple;
	bh=Dja56rSsJWymUw/Omdg2HDuTOFhSjr88PK7rUZ7ZjLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wqg8HfM9zQrmc5OH8rJYiceNabhhaSMHGMoml8fZx9pNtR55/IH7OOSbilD8bP3DK6wEPAs8v0V3qJLhaypc1gittNE2tGL3eMbAey8ZMo3UEAREy/YgExJA3+AwPuoXzR9Es5dSlxrNfdZ+CfFTVZKJiFEsNvUpP+dRqfwLp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clmgbVx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/YNMxuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clmgbVx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/YNMxuN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7KbMt2939784
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0E2fjjl2z413AgzHaMxdBXeMeM9rA+DTDDWPItpGYo=; b=clmgbVx7554OB8pc
	G/Eqn5PlU2sklUehPIBBslc18mUqbknhcJKWwf1j2GEERzez4dCLE8g3ydZYosle
	Z4O8WtSuUT/HoOVPgDnewRUKzY1ITvlH5p00TuSaLJXZyJlqhMYVAe3HlRHzDbHr
	Hitc7/z6l9AXHTT1kxJMSeUWM+4v2eg3j/CnmNHIai170KVhMLN/J2/plEV1b242
	We1cEbXCMuQ/s4FqPyFc+bytUgF9pkJoLw4DI/yK5ElzeApRE5bFRuM17NUWwCZD
	O7kvkFT0yfln8t2kHgiJ91WjyJHd0Kq4nUwGWL0l0KUBzYg5zunCDsM2q2mwqymQ
	oSci4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv3c77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4063891a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786440217; x=1787045017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0E2fjjl2z413AgzHaMxdBXeMeM9rA+DTDDWPItpGYo=;
        b=A/YNMxuNtFfz5Xn2EeC8OgTU22eLNuPMHQ83FDvQWiOv5AzYJeaJP1UtgfscqrrmpU
         dDaf+utq7Neq1OORHL+XAYTgOgsQf8yq/cCKo35YmElkb+cST4jBwFI+G3jS2q6kVd9x
         ll1BNT2t+5/myKOu3fH0gY2Sc0Lm/+YlGPKfDEMFaO2EadLHF9/5JKVkUNRFHQhp6oVe
         iD/sg3wShMo2C78wrZevyijEtuRlFBxExaC+/7diEDZhe4hWZdxLVFgD7uWP+3gKo92Q
         Jz4NZlo3CKqewSmko2vOyqHZthMi3pXbutaBVCvkO5+3gcXEB9OpjSvE6X++QK6uU8i9
         fWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440217; x=1787045017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g0E2fjjl2z413AgzHaMxdBXeMeM9rA+DTDDWPItpGYo=;
        b=D8kZ8pzigZuYvjjm+ddctE9TV3f1D3+Mf6ua4GI+zzmry0jCIgsVCJ/pOLzNJJLJv3
         04d9mjTIm+5/jSVoVMTK0RRTP9F+rEXrM2CppLPsWgyxkPKVZa42hF8zkXKOMgHgwqdI
         NELrfpuAdRolXWvq3d8mTa3aRZ7RzZghl22l7a11BaK6lqWxck8gh90TUzOkfh+44jCs
         g6HqXJxk/2QGuR0bOuNOl05LDJ9Bm/MYEMdm5K0Bqid21tFf8zAgKMvZSpLi1ksQGtj3
         7Jw8D2geTMWGwKF0EknRuo2iG5NKmvxwC2JJYbAF0D0OBXEPTRrjkygXS5vinuqRl1bU
         0JWg==
X-Forwarded-Encrypted: i=1; AHgh+Roh4lPwFg79UCr/6QP8QePwV8PNJnvh1AhgIphfGZkyofyOugvK/aqf3OMCQnT+3xqYscpibubZYAPWOibj@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwnTSNhyYftYNZY/R7XDNd3TFkEMQ4T2lXKpFoZP6/jVestnw
	4KC3/Bm/rxGmc/4u8Sv4iegyg6xG+CH1Nn3ozmF5SHaD/SAL3cHbzK3wd5mFr7WXwH2zMHH8Y+/
	pXW3A7QnrGktAP+zvFwvEX7JRJIiBm+1EkriQU2aK4wTWdTO97jXOT6wTYr8ftBkBLKrofds877
	aK
X-Gm-Gg: AR+sD102cuUWJqzJJKPal5twxHIRkRSgWI4ZMN0UbMNonCA2mEN3oFnhULuaUeWkfLB
	i26JBNj166iMdOWGk2lfqzPYbG8eF2o8dMMJSxPY5PIwg+YHgtv04XUaQcOx+jdhj8fNzzVp78a
	TDdSIOZWN936RSbp6YLKAA08hCn0RGVnJVUWldrfdmEHgWV3qgNXkWSgPi6vZyYrSEy89lJxwWr
	gLWSoPGHUeHZvT2Gv0ITeNuHDl2IrP9zKOp5nA+BpKFOFp/nhXpwSxL9M9mQX5Zi6pDAVuJzQJP
	UrTee7oDGIdIU77FKdDpLnvvbOPoDge+RtVOCBZId230cxDEH7eo+J49rh5akOS340//ZYK2rpf
	3P0f9VgKJygRQkCz8Z7ZGIYB5nV0pzMf7UIh2QHPPB6sBvfAf+FUKJtu7h+DcPFCzBSccyZ8AYP
	po+FCARworYNxnxEg7FOjwTyIvZBk5e01jJCw=
X-Received: by 2002:a17:90b:5486:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-392ec628202mr2004755a91.15.1786440217356;
        Tue, 11 Aug 2026 02:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5486:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-392ec628202mr2004717a91.15.1786440216887;
        Tue, 11 Aug 2026 02:23:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14120447d8esm3385004c88.14.2026.08.11.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:23:36 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 14:53:16 +0530
Subject: [PATCH 1/2] i2c: qcom-geni: update frequency table to fix timing
 parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq5424_i2c_scl_updates-v1-1-bddcb2ceebda@oss.qualcomm.com>
References: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
In-Reply-To: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NyBTYWx0ZWRfX2BOvDAfy9bUC
 c6StLGQMDznif2lFJr9uV/1IvwL0CuDG5J4VKvpi+5yXuuav42oeQQRYQGAPcgMs7Kq8UOiMjFL
 ihqn4sL+XwHPsR+4u1DR5FS6Zom+sCh/bPYmvev+MHJahpPHQj8iGoqu6DqmKkTQ5QaZ/ETluXn
 ZbdOGWCsNX6wia7xS1HZrIh6yT14dc6GAlFNvjdBxT/6H2cHX1d6mz+xj+owndm47ZHcd7awEtB
 xYA7X07phdf5P1XvwgwB9OSuTbNLlaeZb7qgAoIXmwMmyVtExifPyzDQFShIN0QKen1ghTF1IKE
 z8p7SQzLMXjBMeNNUVcPpyYk7BvJTxmBjqoyup4pjKnOgYuYpDHJyJQVp3JkqTUTV/hWZn9aqMo
 /Kl6fw1MWbt9W8qyEaRkD/M+KVyzgNFKwaZ6ClNAjq4mi6OXIfqkz2HEMbKLjmw0Z7hf/9Bt+yR
 l/eYg3WftgyO280Y8yg==
X-Proofpoint-ORIG-GUID: d1jyD9owLtfXgtRQ5dxwebN6vcGUT8WC
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7aea1a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: d1jyD9owLtfXgtRQ5dxwebN6vcGUT8WC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NyBTYWx0ZWRfX9zqCbrwWUm29
 k25zIjU2/5erM0rzd+XprueNG0J8NUKh9ktGc/3qjFzDk9wCajioZp49Nu6CxpysxoecoO9qQTr
 C8TvWUbe8OK7htBxhSlmAR4rdYypZoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110077

In IPQ5424, to meet the setup and hold timing requirements in the
standard mode, update the frequency table with the values recommended by
HW design team.

Also remove the stray space in the I2C_MAX_FAST_MODE_FREQ entry.

Cc: <stable@vger.kernel.org>
Fixes: 85c34532849d ("i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates")
Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..00013b41a6f5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -188,8 +188,8 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
 	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };

-- 
2.34.1

