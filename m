Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80642BEA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692843; cv=none; b=kJro6eA5boSyY/ucpTv8dtdtZT3zOhmTdbddU5nk4Jnr+NafaYKhoCCqtOT/bHsPDc9xSg1ZB77bhgwYY84ik86cqJ2YuWMpV+ji3mAFDEeDESHIi4H82Fhuitie07AAl/pYPG5FOY+PUvVrl25brIL5G3Hvn/ErOWajhEa4szs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692843; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PF0BEUwzL1H9qV13LyoDyVw+RXiyX3vBBxbvI+wARlXp0k6Il+0lMxrCu1Kznq4G9zvBqrXIJ3V7k0TMyGfhlz2QbnKLd3yZucyXK2uDfv0LpI8k49kdhApdm5cXRWWvoqHfHv0dznQ6YmkAq887sq+FuCp4bknzIMQxXY+Dhkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f47cNOju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFfetm2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f47cNOju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFfetm2g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QpX6594118
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=f47cNOju6Yg9bKgr
	pVlDJ9ZD1JPPwYQ3kYTqh0QE4byrKyuysRvlI0cjuCdzouB1EIo/rY7ONJaRiM3D
	4e0Wfs35yErbB8+a0S6GCI2+0GqTZkiMDgQlWuoJDvop9jsAe7abC7somdrXeOSy
	m7w29WbZpnvknbkOeiNeJyscniNVcUN+ZRBdwH6oFVFs0a/5sZIB5L2TsOYGRmVC
	EQwU1HgTvwJqWAGZAXg9ySNKRlz9FEBpBc6GCxwf3TTEM2cUCozy+hj/taydQVl8
	utrwPClqiXnV80cVBd6hlfMBJ2+FOMTamDkS3kjarFQ1bkPhxyfzaVzLmQSUKKWn
	yWQ2Wg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4u8jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:33:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso527742a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692822; x=1787297622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=iFfetm2gDIAck+ar7ckmYqV6Pf7sVCA92rQe0Qe3H0FAKKjmlu8lLGI/DjpCy35Tff
         Toq7GTgoXECF62zhBiI4unHD4axhnsgpPNWivX9YztSfZH39KJrEo+Lsaf23qiusm7P+
         z2xnx6t3zgs+zCTjuRmpsjeXD5NF/SFmmYWbhOcHCXse+PLo3lzIYpIk7k2OZPvA5nnn
         TR2emXZfJv17h1E8mK389+y6caGXnprrDDWGsdrMTeTIjKd/4511gn1s2UGv8Jp3b1CV
         2zICOZrBi2fkQB0hH1SJGy7DZ1kDhA+5yiE4HX9TM5P9OJaoGFndvBIxKRff96PnilIK
         rHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692822; x=1787297622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=GPcCuES9xur/iyCrIKU0eCJUBovcHWFs2nJAbTPMlV1nuuMRNRF/5KcnpcO8a/UE+R
         AaAxkjXsUEbfbFBD/EgeOfekhrF/7LVJOl4O2ivprB2SOkpPc8fN/NY3hIzXnA1rrTrD
         k5I1z9xFPGQvstPcIz08GNjbQCaYE3y2+QIKy7u+qPKwb+nbOlLFOyVpOqiYWOo+ctSd
         7J+5Qop3UG8s3WYn7AmFdFSm0xjBZcYMiw2oBw1uun4T2vqguSFhrXbiWbPfpG8ae2MV
         vSxx/szLVL3wyFe6IM4qn8LPeQusbz+G2TFAtmShWxvcb2TEilj7o8uBN2Qic+s/CMWW
         Zrzg==
X-Gm-Message-State: AOJu0Yyw/KjpfIF0mBSOfjEosAgOUKWRGlLA4r2EOzziQyq64dyFiOMJ
	PcVKACwyvJ0tiYmhllEJ7p4oRZS1h4B5Sh7WvG+3E/16A+49R/ux6fLMaIy+ddE/PGQ6YHQPB0B
	8RD0Ufx0qgw0lxQ502DKApN7AKrZEkKu2aepR8fg8ys5f7MTqRqvjgZX5ks7vm/+c+bnj
X-Gm-Gg: AR+sD10qHRKJpw5UrdHNcAsmQ0JPOkKfXeShRWdWqzS/w+pm0uqP382Shj33qmy3l03
	f4owoGToHbzWqg6d4V99Ek23RPstMd4DS5Wcji3EhOHHK6xhS2g9dSFKqfhobfd3L4TObpTtHG7
	bHfrohz7uC0hjwI+mhdCK/5EgTNEkI8g+UfJ5V7Jnpa9nNN1dVzH1JxXh7J/nrFz2ifwy5061aN
	YEC6rk8i3pjyySPDRyjq+lEdlHjBLDK44m4wMvBPAcsvzlpDDRzhnK/JMLyMxvxice5zRHv9E0p
	q8J+iLrVkCoIzzQqebGupe4N1XbsuLkglxuQzzQVef+jq4/uAwdhI06wkHxyUPEV2t8CWKFEkyD
	NgXU2u4i/Y4Dj8Nqso0hd6+nPuOl26mU8Xd4XA8yQ2P15HCEo81/p1LoWOwB9bUWTYC69nsj9EV
	Olmix/IfQgKCtBgtPdjfUvzGc=
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4632003637.28.1786692822529;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4631945637.28.1786692822096;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:41 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:43 +0530
Subject: [PATCH v2 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-12-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5rfTSqeF3ZffhEbWQ/MCkAbuDD82v1o8NO8GUugDaLDLaKTC3LlK5BcLVBkEaw7CxqOZjkCyn
 LB5WOXsXFY3DZZxny1BmotvMhg1imljcHSJu02Gp/nx3UKotZJU73zb
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: SvrMgvPhTjjYaeQUe1_8A0N0wMde4_nN
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7ec4d7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX5eZYuPzbOx7n
 IwQDgYOdAirPurvbCnjjMHpstrbU+PEWgtx2E8GN2fdYxebbfyIPeTKqGgln5wpJ6Op7GI7WJPe
 6iFBO+XQgeStjcgLJ2QvWKTDoW3kjOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXxhKnTlfG2tib
 ReBQ2NOUn9qEFeizUOi9EbTkDreacorARspTLQh4pcXdjSv3sDix5JECjefAHj4NbFTcT3GkdMq
 ZBlCt/UfBCI3sxahNaxVvIEuXsZ9u0Kx9xA8Q3QzFSMA5FmvLv9x2rUuqGoMDYK/zx6cduGZoEZ
 e3+bO2r/tTX/Z9eEQ7gAQNftb/bpSEzlUnwg2+LM3EUS/FwFxTFaHIEJdfEE8hF1/eRZQeCfNh2
 t7p2swQeR1s+gb2We6y3NtJqS3StCKp21jE4XrxkUE0sJQMAKcJDNPiKTgg+H6vW7AwJL1hA+DN
 QIz0BW16DR8KYDCwXgKGkxaJIyy/nHdyeT7v6KmsiUjPpoJSQgOLDyeVXV6ysPDINHHxuiDS4hx
 K+XDW243Y4CRV7BTrcrzNMx7RLiltn6lUXrNM1OzrUpli/T3kn2btvVdVx3VJxvbxap6cGtMTtn
 4J6dKrRPzontn731jog==
X-Proofpoint-GUID: SvrMgvPhTjjYaeQUe1_8A0N0wMde4_nN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

