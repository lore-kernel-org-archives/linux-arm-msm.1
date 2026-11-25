Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590778;
	b=XLRhqA3Qx+4FRxjA7BGnRHII6OMbfkWyNZs1AiDYsUwnPgHowxp1PIvoNe2C0+C1H1oH
	 O+X+ou9DJW8snKmU50syp2/VAfZVp1UthfmdX7hLnO5EgarctEdJmQG+Vz62I/BDqPEyB
	 BrFk4sO8gFqygt3O89FguP64gIEAWo1f5eTrsPkQdJs2YRRy0uKhBXyMLaRLKh8iDrZxt
	 q1ZYW3Mqe9BmkdB1iQreB/Ekof5R/AkfojuA7omluaCLttbvn2UvZd6DBlm2RN5L6gX9y
	 dmn9lU9V1jy5tWyl1DyttmnDsbWVtvS8ZGfxtB4ywh9YIOxux1Fg6grqKxDNC2w0wgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
	b=YKaMqRyyxEwkStTLO3O6+sNC7R8kS3lBV8ki4Yt+c1l/JnnZLHFrKvQ+IYIyK+eFvZdW
	 87LkhrLmw9BSSJ2uPHZ9wEUHwagpjM1Wj6snmCUCHnFDzgnhRYmPb36mLJh9mKL02LZma
	 UM3zKkpkgrPvTJzU0ut5CbYWlMfunZDaGsNibB4ZOkwLqf0E8N7MEzhuTIMiJipb5pL7s
	 htQEjJr+6G2Q7Y1ENA8iIu5LCkeE8OaDzdlb3EYBnG/yGxmX3TgPTpbJtITqJm0/dza5I
	 N3r3O79HHPATQfKyI5OyLyt+P/myFgGcp0E92oU9d+AVUVxjP8YEVrapt2sMwthbWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlClsJFj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I5zSOI/U";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7A606A697
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D7A606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlClsJFj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5zSOI/U
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68X0b299995
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=; b=BlClsJFjB+bV6+xF
	AChiCcAiVqgnIN4K6l0emyGxkAfxCFXO3mKAE+afP0DujrN+EZz3ut6jpA2O1GIE
	L/a5n1lzvTx5i7W1f2M1fi/Zzag2kNPuKOztinb/Sxl7Bt1fRCFoNgZZeOyNaU8h
	zMg8rV7asXGnOAHWOOY1rPrKrFbFnRNTbn8uK+x1nP96mcOBxBU8iYiDRd/GmJh5
	hLo0UFVlib9bzhWb03xg6JtqHs6vkBgsFen6lysg6p9O+za3xXE4LsSN+vLhaJhh
	lwNLSPN/EVPxpWpNrkA97S0u9bOmm3DdHQR3g6L/GBjiek1m4LgZ0eshS3x93BZF
	kCqL6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rs94p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:12:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so4546953a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590773; x=1796195573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
        b=I5zSOI/USp8xsc1zeJcBBYYV/lkGdfWUl/919K1JSP5GYwDwv5+ZpBv/COwM+V015/
         4n+JMtOyYUJY92Vx6w1PY5ouSwtv8xw3ADZcR6hgQd0glEjEqhQxwzbSAxU6g2H0kD1N
         KZ2uSjxbg3NoW8MAnqy/kt/ELaaXo6kqtjZ5sw1iv4K5IjLX55On7p5RMviCXc/9ORVG
         PTNiw3N2LOzZai1zGf84T/G0PfkwQCcMX9WGnWmMYYpQ7wBMPGRj/K2xZfaqjI39f+U6
         0EzbQLHgtQBr5EqMUcJ6mHPpKEPiD5l4Us9F3RbUVCf0NKOK8R0b3DnkSUpMD3uRSQCc
         VN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590773; x=1796195573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
        b=fMG1KBMlF0xVl8vciVtw8sx9bUGng/tqbIqa7/OHFFfcQ/7d0vAuLBb37G5EzAjIBc
         /II0syQkB7c/d+VTXoSHwYsy9wKFYWVRMVfd56WLvIvIr9iiPay1NkFxwEMtAFPuoHUV
         sNkS8IAuzwgBFFEGQyfwrUZG7xXXq34Z/JLnSOEhgIR+MzJgrRoYZOcgq2ORAIJGxh5a
         JrOhuLbqtBUjYtvB2LhT+mijoi/a1MLv3Ll8tD84Y3fLfC7Ic0UweWA6FB+0neZGwP0F
         2XPHxQl+SUBrBybXykGPSTN/lrKzB9OoGLvNj1IqTNafrb/chP3YSkpHK6r9t86DR6w+
         zYXw==
X-Gm-Message-State: APuU4Z+7y/dV5+AqZR9n88hh3VAcQqO1AiEAxyRVVopP5W17zZ4j6ySR
	WcVeS/+YYrSQezbLcKiXoAH5k7lqG6+Ta5AN9+nkaXRkVszfyvqYV0qoAPxoLHViCHMRStq2Dt/
	k/vwzh/fo9+fAGy3OHWo0E1d20oUPQj/AjwOKqZpKuPKiBszQ++abNkVUVrNOCnWMf3EO
X-Gm-Gg: AZFdTZft99JX7CYFazN9sps9r0VEZ5Ouzd0463don+ABNFfRpCK/I/ebYd9EJgWPT/I
	6EbJOhM7cEQFpQPS2qC5GwO0FDMnbPKa40Ojg73sCTLJSA+DSN0C9oAqfyxOhLMyK/deNkcuJG9
	PxPab/eM8XJ1wL3OuhebRJe+4mEkBvVw5Lwn13ndo+n6jFS/ijkR/ZRTu3BEiTwRrPFicGsC9dU
	tZwVuyUWNhpMRopJ/ScvOSQL/KxgTcthFsjLAUd3uXb28Po7+89DbUaPPBu3v6Ou5tFYKim4IF5
	kvJajkyboae1NuWzF7OncLZN4nhqywz/Y8hqssKojPbmwCNiSHJhEQcm47YzPtwALrcGSAGkM5q
	KJaTEIbQkc/4sNsIl8offrY3M4+r03h4i4oC91RyeGr9RQM5ecNy94bxq5l1mgNLcfIRh9Ns=
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18399570a91.60.1795590772843;
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18399550a91.60.1795590772381;
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:41 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfXwoA0r/sgf0o3
 ioWE0dQ3eYVB6rRI2xw6vOMFCsg+tJSL27Nb8lVRsppzM5yIg2nOQMmCtrsY8+Ltsw8zIpbOMLO
 StfFwYgqmJhCqyDRIyhB0NQARLYKzvcpR8efUJE1/qD71fWVql3Ha/4ohLwGs0eVDrRcz1AF7Ep
 VoCfKKEtmXI2BRgxYW2hIVqUlKb+14gvsFki2UCyr8lBF5iUSLUzxpOv7rvvnhnqoSn7BkAi9iG
 BMbx9Rjcd1RXq30kEsDbbFl2VQJ9rMRwLiiTxmgetzCuyid03zdRFLbvRXY+kFRqxg1MO+Myy2b
 WIPAiLno94IDb1Wjgu55hHc9QLc1I3EX4VZRv3YfmH7ywoP1O3NnPXs8N2e5uMD8xBaOZVtJ09N
 S3SHh5+TokkGrt1eNf+JBuJafsybZTkDVAwlJMjLxv6gdbwhI5T0E0FF1+OfCJpAGygFYjyiZky
 Pu16C2JkG5hKfmaq41Q==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b068a75 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pcj_qY4RVFpoKUdRnfIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: zDWNIKm3s0ki8gR2jL7gzIBXi1fEC-TE
X-Proofpoint-ORIG-GUID: zDWNIKm3s0ki8gR2jL7gzIBXi1fEC-TE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX/DZfx+NFKAt1
 huggDCKyNCJVZV0zedEcESFZvluddLitk24hueWzblqfIQRmZmYlLhOaEzWcbP6Xcl5eko1qm5a
 CFcggcH2TxNWYVd4SxUmjMVBLpPelT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
than introducing a SoM-specific compatible.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

