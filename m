Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809631;
	b=YVETCbS+84XTOx0zMeJ11XJT2+dRJ/Zexo9wiYZUcZcInY7Bd5hjGP8R7yzT4P+Muwfa
	 snw3fbHIGl1NkW4Zd+uv1puVOakxrkP7Y/k4hdRmdvGEOzg6Me2jJq2Kf5NPwA9WlMjhZ
	 m2hjIzQd5FZM64oHOytG9i8ToJbfnEepmRNEPFn5LZImFvybIN1AajwDuZMpaomMqCQvq
	 Yt+G6qDpgs71B1gX+gKcvFWoTdIB0C22K7/6a56Yl+BKiMKJ8MzL3SGijnkS9n7zqgSAQ
	 k8IaUvf6o0LaHoWb13myUk7DAZbv4xrlguy01rlkJYHJ23wM6LZ6KdVbuuyJi6QJRig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=kfPHSNcfcEUoXK+trEZs463/Fl6IOCHczZ/WxLsfULUD4lOWfLkSz03oSR+f9dfRdUMY
	 zLWohWVFR04QCezJ6UQeoUhzIFG0gLmtenHjKsColFN9PqsDWXYuOoUBaNbfLTbjnWj/x
	 MILpfbyM27n6FI91/XdAA1r5gjBSygjBL478k5pxtdKNOUCkEDJBxULLOlya5DXmnY8+t
	 e4/vE5yj+EgaSiCvq35xxyz8MQh4LbXEg3+e666VDPlU/xSZFKnJeFBTFC4NbFnNL+DBd
	 h7Y1kDEhwjhZhc9Su9xncV3wPyJah1bPt6sc4VYTGb0m+1URrObUV327p0lVNXFPomQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VksRaQZk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01D606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C01D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VksRaQZk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LB8k795949
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=gzqCNZY+70YgH5UL
	APxg9Ni92XafCbPxwKXlw02fsH+5579YKYJH+Yy+l+NbD6943WlA5xYwMqHA0nOa
	J88yWLSY21PgSMU+CmIuVGr075SBh6HIe1S9hEGVCh2nDgNFOMYKNq3Lcq8Q8Xee
	DyliXAGqdYo0qrtN0GTr1wg+TnIowlcM1pXo5FDrsnUrxVMhw41sZnXwOZ71r6pq
	pE659skkP6mceH7TLfuHZLEoRFbxMQ+o/M7Eo0FLUArPURrdFWQuAZfpM0XTTr1S
	c4i6aMops/CHwF5eJkuciNhyNb2aOwUOE1XAMv2lqzl0Rhp16PNT/NSk9P0Wedru
	9BgiMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc0ru2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:13:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so2352746a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809629; x=1795414429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=VksRaQZk1+mySifCG4lI3FCReUs8kjDT4mnO9WDyyx4q6kQpvLEJX3iiGZIArkeK41
         QIKxgb9w78IOX3e0Vdql7teJRNBVqGbtoX+7naSkIYSn+45StJD9e3ZUuBDhhTrN1TrE
         BrdDI1K4NjpqqqbeRU03W5xNanijizFskQqfBW8H3yZbWzwEzDmfa9LaJ5FsfAJTheo6
         Q8+oqMuQNdtGgdBFh5ge2zU1EUvF6dojZ9zDHXzezx6iv3vogPj115Wd9IihyMOEyWqh
         +ArAnxyer6n7uk75HZV0jgY5wKgqtkmYMBlqJYNlSBOPrvuE+clb0RBK5aNxw/tfrl6d
         bsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809629; x=1795414429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=HAbY/S7IvEwO6EY3QeD0d45dqz7gyWk5WRt4wkbmiBCuXBSjT8q/uHfdZnCZvMY3hd
         pfhu1afmbuSPqT3nsopLdxPLe7ib9zWTOpw8YBkiE7uHQfpIiWPpbKT4uFrGFVBZL23S
         a0y7r+R3DbD9Kfn40OZkOTPNkIVnOxN58u8Hv7u6wFp+5GVm9deupl1+MBnISU05Nhlx
         FhJLBlp4Kiydp/eJdeUUJpm3ZeZqjg4qNXwgCLLOUQJ63EYAxZ5Q2K8AclZzQgZj5DP4
         l6f4R1bezDFvcaqIR3/2KO8D4q1r0UiD6Y7oCjEd23BorXz6Q1hFbzHPe2RvYO2WiiJi
         gI/w==
X-Gm-Message-State: APuU4Z/y5iejzusbc5+tasZ4G2zywZ95IJPIVMx1k7HAkc2yIaQIbXiQ
	jI+DTxEoeJ/7mvk3rZWfDfMbYcXQEasLSclTYsOwi4QE8wp7QltQHEDP240OU9IvvkCthadQMs1
	CpKbCkE8ykPyxexwP4cAc2s3nsQcay1W1AILhCp84x0PEpc6r5q51emR6/3QI2+vzUNNL
X-Gm-Gg: AZFdTZemlcm2K08ywKZIRk0wcIoj+02Y+tMyP5hTaW4WCspXQyBk9OqfPAIWi2tIUIz
	9u1F4/YaEFWL6sXzTeszKI3vyhIrKK0b16E6YBYbbNFkPgVpxnvbNVjQV4GHGX8U9j8gD0RzfMP
	nUYL5Tk+feaaYdt7LF5DWkkfHB0LgI7PCc4Rwp/xZn/NF52cQkDtYDdy4E6AXWVUwQDpXVn/4w8
	Q5eejDmQP98t3ZnoRfRvM6Q/c32tj+08sjmLbQB7qXIBejss8HaMoA/+G7piLThZ0Hc00mG/w8B
	DaBegfeKL0lpEBtZ4AteqewLgB84xb0K7HatOnBa4qETYdj3EUAJ1Gquja90Hb4luaLiMRyUcqN
	o8tNQWXecJUFOh56ToQqUYQ14yzlxJwgGLUEe9Q+TUHp4m1CnB6PSITpfmps+njmg450y
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899426a91.65.1794809629009;
        Sun, 15 Nov 2026 22:13:49 -0800 (PST)
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899415a91.65.1794809628569;
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:19 +0530
Subject: [PATCH v5 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261116-pm8010_i2c_support-v5-1-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=7xM5Y8xIR4/FK1WeNmeNY9E1yBIcjZe0Km8gqzVoExW414OwNCCbM3w/seI2PWz4BGHC/D2vW
 D/VN9SqmI87Bu6db953jrVnPy8unrYsdxuZuQmB2YKNoPH80l6DHfaE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX0DgqJarQZLhW
 d/DMtWMqHbHiTcx37ces0jOFbrsvzsV7dri77DChBKnRrNkCJgQEie7bjno691SNkmE5qQKl+CZ
 Y8Nk/+Rvs59cRAgi0v8oKji+747HBSo=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afa9f1d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nmfPtnGsz_CLpmHLiRVgLkNSIQuxEwlf
X-Proofpoint-GUID: nmfPtnGsz_CLpmHLiRVgLkNSIQuxEwlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX2fEdYXHQc7M8
 yXqbyAitsYJ5s/pBLx7chVBG0E10OQVEjg77HGCbN90LJ3ZvQmpzvsqYPwKmMrNudOi4aO0LAvH
 aBt1pUODJQcubcjSGs30Bz40kAcFoK/CGOYTBU2MEw2PUWhBeaNqZHs0ZNrRdQrT1DPHFEo74f1
 pf4Lw9XhWH1lp4MYQS6q4YK5LwhWNRprQ9NG/ZKuYrIt+I2hDHZZqY73k6K0kxbkiB0gVzyNsQE
 0ivKim/g7TrqhUh6NOOBQ9/rD377H27GnLF7xw/VAwxB1ZBSptTxAZKjgysE4E/7YNkB6ghsExv
 eAEqWux/vcPcZWuYHv5zksGKLlaFbATrLy3L1rWn3kQFPtIbeIMwslVgaT/pOHhbOGF4BP9pEeW
 FAbgGxtn1n9njDqkVlOT5Nco+EUAJSfECR5gCrbf17J8QiR57+HMl1Vlxjq91hCBkZbZq9kYt+d
 C9kjFsCFAelbQ+A1xLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

