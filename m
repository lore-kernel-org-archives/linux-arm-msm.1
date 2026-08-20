Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0F411F93
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220540; cv=none; b=ofVI7ygXE6wOyvQfbjKKveBKKGe1TnD0Z0QFDC/qekZX4DKfiR+6LDvNWOu9ZKEXB6r4N9QxVOeBdmpbRlxfDXcv2Jt6GqhmoIdVutVciPDjtZdT4wrN+XMqCBHP/lOgarkTQowPC6ZIoOt5+hrJrrGiOV4ifb7Lu4u8NB2HFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220540; c=relaxed/simple;
	bh=TtqjP/pi/AK3r/5kUqubs2fndJh5LAqu7eapYk2jRW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGZiovZUYQMPKD5IPi2MvPxjbBF4Lj7kfdUy5qLppjELQGudxWZ9sTY4Ryi505mN8dB0kxMHT0XA/uX1mmhExJnFrRmw+gmBNmbiRtTutzPVaDKWciqK4TNMFgl2CFvmB6OLVGQL1v3/ob7HWyjslry8stD9qjN10+DtRxAy1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWaM7b2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPt9Kcu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWaM7b2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPt9Kcu8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eXQ72161052
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GevB+jEhNYhG9RjZjKoCOkGbasF5w2lMZxEjd1Q0qN8=; b=dWaM7b2m57B+26vZ
	Ot9vbcBhJz3KPu7bcfemaJmwK1nyXEfZWDbJ6MsBwolMfaX3TtaBSpac0BLjo4l3
	kOpODbaLCkROQ2tVzy42aGdIWKwB0KlZbyrEQ/D7c78Qhr4COnMi9HL2z5aYIBgO
	sVquDJ4idSbsw7DLBlwCBlhKM6MdEr+IZzlBYKp0wOy68FjPwx55FDbvGp7v6Fxm
	ldrCzVCwNb04Sir+nMQZ6780IbqZnIP4Y2MkvtB9PwGx6tZwjNFXFMTNEYfy3lG1
	uRtQqsW9UYutpfpB6EEA3rymQ1Ylu8vQ2uu1+rks1MxXu3MlZGPp6bb7NKS0lItG
	c+1R8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso234306085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220534; x=1787825334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GevB+jEhNYhG9RjZjKoCOkGbasF5w2lMZxEjd1Q0qN8=;
        b=jPt9Kcu8CGKX/aQQAJ7HUBvhxywAKtBw1M7McFP10aQaPp0JtPATbN/G9AK3+uWWC6
         0Bs35Xf1Xxf5t6an74IxK+C6sZjup8sqEIUmUU8I2nnPXcbZjJveSGeomcvFehdZFCGD
         M06TW3A0Rg6I0q62lYZW16UQ0WafgkZpHL0U2LytkF47ZRdDHzcg2wF0TJYKp/ZAEXGM
         1LwGkqh2wuELB89drwH9gpwPXLgeCC419B3jq3muaaznB3zORNXSOPe5fDrjPqC7aVyr
         NLtDhAvBrKXcEkiyi10pjVPjNQ9oqpIcICWewISXh2411tRU/G6tcm52btLxhDS+VSpq
         2a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220534; x=1787825334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GevB+jEhNYhG9RjZjKoCOkGbasF5w2lMZxEjd1Q0qN8=;
        b=NwSMYvgw+K2aDjPQjEBbEEx0wGyhtTZEudCzxf7XHbgXLcKBYTem0xzGdmbLj7uPsx
         ZqMRfw2bhXvM7qKYsaWL6v6oRuBh/+pfpe1+NC9Vq33238TXNfSj4m5yEli4iB6368ig
         kn3+PhPKE+TUgZ0gFwINTT7sgfMgX4OADi+Gls7QxxFRmW+uJTH7WzeuLOfeEewFdkYE
         Cb21J2YsOeLl0fxXmcZXkrGPKQKCuE3GmhLACC+EkQb4l8Q85qZefHKRGGCglwjqAqyN
         1Cl3yQlSrs3XaygCVXx3rKw55fMA/CK/udTRjJNQvr10C06TxSQjuWMOK/4+psbtDVXR
         rIhg==
X-Gm-Message-State: AOJu0Yy83pjxeuFiWcWDWZrkDBSML7t4vRbwgV3P2sTdTyHEDUd5w937
	DWoWhfm37itppuvcbGlQfGjgyy1zNv3IujLkGdiwp6OonvJtWKf0UUw7m0j4SVpIz/Z7ZuOVoci
	S86W7HwjdqOQUGNQTNnbuO/9V//gA4sLmCZO5seU2AnMB9qJDcHWN4jLhdUfDw4iKKiAb
X-Gm-Gg: AR+sD13B/+ijjeA/ZbbN3JNQ40CCuXcvemsCKhQIWkUlEDwEezzneFh+bf2W2hbuwrh
	wO8fwQDBuTS80xTCW7ZXlJYDTktD6NMUiJwXuhDQEiqHASEEqhoDRYnLidhO4QKDJb+CzWCgI4K
	zU8ubgLKJiH7sS6UrsXzs0gEOp3AP/Uu70IMBrRun07GlT8VBX7gV+Lg5nvPl5hj1fReV1avY3J
	FcvQ1yAoru5ppVFs0iQ32P5OLUsvuEr/KucduWBl3H6WihnmAePU+KU0JJq2Kzv7eNl4OI+kY/Y
	UJHSh/jzd+H0XhbTZeX/eOGALp6wNqMBLxKFVr8nPhMW7ZpzqLObSswwjNmE9Q3UPIvuSQqsFJO
	wxzVLR6K0
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr991632485a.21.1787220534509;
        Thu, 20 Aug 2026 03:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr991627185a.21.1787220533986;
        Thu, 20 Aug 2026 03:08:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:10 +0300
Subject: [PATCH v2 07/16] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TtqjP/pi/AK3r/5kUqubs2fndJh5LAqu7eapYk2jRW0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtH12fZKjipypiquBel0oTJnLFr4rZYYXJ/6v
 ecX7PbBXRGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR9QAKCRAbX0TJAJUV
 VkHpD/938RHJNyk1VPMNf8qFUDJhO2HuaaG+F5ecZ0p2XJsSVrBoRLc52ygG/fambwQTzCKnWo5
 9FcA/laS5COSEHZ17YSCzapvyrDflF7LLFu8i/Kc5xVyHy1T2jc2Q3SXIE92r4loXTKfotCrCqe
 WIiBF9ayyZYdl1A+nLSDIcij7B8+vTpJ0/Kdx845kjkR+WLQKxlOGbRCN4j93m+9rTC2XEXE9Y/
 VjJKAOHgwFlq4OfB0ml+GnDxrWJDndbMBe8tJldTe9LYruayBhuIoooRlg7C1Oarux94hPu2Xmw
 Zp9+4xN7sGa87WZ0GZAbcj4dDHMy2bVABGWM5SVnF0SZHcGzAMJkpMVhZP+ecQFGHbufuJ/eICp
 KsR1dpGHTQ49qP6u0WUfbapxZlUiwlK25Ruay6Or2eVWhnxAC+C13YO4cSPbVlMgZZ/LyLRREIl
 7rBI4NNybY/bTQ6HrmqS5xddKp70pNbGczINi0mmKp7iZRJdFypjr/+j5tsuMq6D7IcGe0ls62D
 UghUh0zT/IR35s5XPWNBQcx3XpymO+wXcq2GUo0/v9zrax0IsqvfcLPJYjAv/tLoXWdscMEnkjo
 Y6IwfXrSdkWgA4SPML5YraReS7yASXBYQOlkZEGDqx4BpkCpQdEr/pDbWKNqA5RaCvLSmF4+aBZ
 rkTc+AFYSLuhBGA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXzFwZA2PbBN8x
 vCRpEPaVFvG+qw+T6a+b3NeO5kXbzbe7wyPnbtwng9bSTgTWCtUKYX9IUChBu8bH3A4K47q9GqD
 uvlF2M70Fp7puxEkE7Wy8puWM1gJIlweHB7yvRrL8GET0Ilg8Tq1tUVBvdBOOQwmHoAWcBqoViK
 cNOL+u19gcXOO22llxamyeUQI/udth0YQh29Nq99Iu7RyNbuW4DNAuj9AENbQMOmXyyWxpmVM2V
 TGDqkIa3exZAABagey/RYo1H8EH2T7k0XmeOQJ1yG1oDC1e1/kh+rZI6NnZ84mbgMAdG7yJ1q1u
 FQJhaji4QLae6GL4crguX11KVkt1xUKCtQEv22mo5DI6Kp82kfqw0DU715tLBSMFo4nECdOm8rs
 JHj6HJnwMGF9ZVJirXAHcgyvmmxqSKTo/R5KBTV1NbSvBsFN9VhBmI5dYruLhfj1iyJSWkJ3TXJ
 fmvsa6dpGprn7wBaVGQ==
X-Proofpoint-ORIG-GUID: IZxUGFGob7wwnkLUk70TBnZs88qx8hso
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d237 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX8kZEiZqMuDp1
 9qnOucmVgTjmPo2giJA1an8vNIr9eQZIYML+1jcL8FzZSdzLTaogQgjoo3GsWm/wiUR5ZAH9MCp
 mOU65EzK3HM/NE4vWrnL0j8lVVng3ss=
X-Proofpoint-GUID: IZxUGFGob7wwnkLUk70TBnZs88qx8hso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

