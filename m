Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558051;
	b=MsXTV+fiXpVc/DOslgAPqaAKvBjk8h6QV4niJPIPaDcDpbCDRucL+kbVVuU7jsKt0A1A
	 WQD/wcHCR109BgNApejpljoehzbMC+wwJGCPqwmgtIgn7lzaxnXxPEkT/5cnbNbIsaM1R
	 t3MKFp3XeU2DSnOeXXM8XvFgEQjotbJj4Maq6ophxv4gL3iuPcX3FdNfe7qYOzICh6ZmV
	 EksGWwBGDn7gtvHTLkYh0Uc5UF1oaSM+u9H7ujHG6xzkBOHFhvj7bjKcgB1BqnwDotHC0
	 gjc9cHKN2+7KYya/WvzybaTi1TquIVOkyt/n/FgxJEen10d5BOeuLhKDDY8r1+NZkhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
	b=c7QNsp5Sm/39tFeSweSovCrzeLs6Fo+gm0W0ANF+npe3C3w30z7P8NFQrTr8QzhdI8J+
	 bAI3X1dlwx7DmgJ5Wg0Ikgxt+VKWI5djxfOc7Yrzpz945rpZUIi+6CHmXgr+3TOGbgLFh
	 88NAqwrLiljQeZq0ok8dSMzTDUoA7FcdHo2wpc8WKfoWfeViEU8UDJAS33hur7Gbg1mIN
	 vBKhMCSrYQd2BiLHF0XoFo8/LthQTX5heZViOHXpRVA1LMOIYODDm8zEFcET8/NvohvEP
	 XZUFkCq6rEkpsYoIvKmTtLR5DHbWbkCUouHbyN0564ubO6xh7LNwvqLgYqecZMcT7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94942606A895
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94942606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57jVp3284130
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=; b=XOnar0iuZvP0vmra
	srGEP4McvcKdTGb5rWUtyf9UovnD38hxYKrVFDe1yhtN9e4DfqjDHP6d02zqYqI2
	VxtFjCk1o/AjS4Gujc5zUZo3Ma1pJ3X1ErGLf3uc6wjRuoo5YTWkE7wGy1soLNP8
	zNbjMlFSr8YVk0lQOM1181dOFGn0pblNRrj5TH+8GCcm545fxBq2BrKX8yWJycae
	U/pE5qhwi/Nto1tATrbt11ts4iL+GNOlSPSdti+Jd0R45WLVLHusUo3iduQ/CteG
	Un9c2TlG+j6g+HPFPrVijhUs4kqFlAKK+lNRm86dPnvTXexftWQ075TJeZ7bi+E6
	bsi1JQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gnrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso3334301eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558049; x=1795162849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=FsSJeJWMSrCY5YLT4Y7H1Loni1WXW2Fih51KoJdqPV0+36RryA/o6jlLQqK/V+Ouof
         mztMHHzfwFOMD6wNyzMDKAeSKR0L+nX9lpADD7o1WvO8lB3c0Nr4ZQM4VabT5bEtCMlS
         6PlV54CBhZDHJngd1dfgp/lyfB5E9GTufFsLYVrWsUpph11dVrVQDZywo+wbHCs9bNnW
         +272W9TcFsgQclQ5lLWJm8Pt39IhlWclEs9bOYFpJ5ozKCJmgHvSC9+XJ9A66btPA6qe
         fN3A2E9YUlRwO1EDuZbYL+sbCPpTDfCY4rHrE8hP2uLMGTO7nbjUsNqwD34gLAywVrJa
         9Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558049; x=1795162849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=Vz5ZVDpX5MIV/6li3VtHHwpeuMJlrWa2ZnamCYgghyJPAuakIyb5nM7jf0v7BYsZZM
         /IYF83rI/3klL5MfqCSlvscPURGgBoka2zHaSqzEwPjNZoZFibWuWA6wuYUM///g896p
         sLRy8qu+QWoz9BOFA2iDM9L7u+OPOPvM1yeqRPbbOzQAq/AX5E8k1O83aT2S2A+fPQO+
         TUVHfsFHyml32y0cKfFpPVt6SKsxLN7dlgR2vaozv3SvCblmMZA+3RrcMh9NIAERS1vw
         3mP5WVw9US28mlaDd6nmuScZ1Z6l9wg+SJertmwHSnCLjCKKGb7K1gdPB5kWDaok/i4m
         UPfg==
X-Gm-Message-State: APuU4Z9+681lGU6e4b9eED1a7uCdO2Q9kBfzQfOsoXu52/Oy6O0eqFyy
	tvxJ/VDVCI8iuLT6b/W/fn5rs+9aYsEOVaEJ+ZxRRVBAV8IdkRm4oe/Y01sMwy2KK1HCESBdvF8
	UK5Y3KxdoJYiEmyIeby4ddfTPROk8WFexPyCIAJgnn0nSXzW++Q+YWVoocWJIlTdBJVEu
X-Gm-Gg: AYBFou3Tg7z5rlMcCiZwAtGuhOlFHf451yRExDCud5iDqdK5XXFgQTIJLRvVNVbYBCU
	trFmNlXvVA6MEE2szbvHoNkxW+I56dpHB5AUvFKiKcjay9vGt/a8Q3R/hc8s2EJJ8mkiz6bPIuj
	seZKt/hrz1iD3AskfnKPtdH6Kmjd0g1s2TrlrBhkLbG8mASHkKGDpysl3ZpMkOMinp7GkSbBXzP
	X+Squyc/tG5l+om0yWvFAqmYGO6g7HXypRvhJzP/Bjwb2xyMUYEjl2NBxWLzDJEUIa+ucQCN1QP
	tSrVIbG+A9jK0QhOYXK99F+zY0KxMHnKkgQBHLcgXW7O/6ByHR/HySQL8q3n3k139wMkpHG6xj4
	pnVcTsHg2sJCmY8dWeyacqRZpG+sjsEM9euMWnmaTxGTZNLPTk6IITpjGIQsF7rayyRwcaf6oKq
	c++wAb
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576638eec.29.1794558048681;
        Fri, 13 Nov 2026 00:20:48 -0800 (PST)
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576597eec.29.1794558047883;
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:50:22 +0530
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
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
Message-Id: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1388;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuZTlOZoHF/pMdejS9tAzCDoNgWwALKveQWqW28u/qw=;
 b=dCoQcm5zUnZnBakJObf5tk4CG8Voi6YOt44Tna9inGh6/wAOgqc4RUMwPQxcpHgbv6UiTpU0p
 04G/ojRWDWdDiCivEY3L79mZsI4Kx89yVjXuoas0P6pLpQtScEZmFSt
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX1XSFzrgF+wlZ
 x7iF2ZwUiTbj7r5SL0ExErtseukil8TCU+xK5zoue9ewYVI7/4D7Wl9xXg6qmZeBA2mMVL/y0Sx
 hEq5iqkdj+mObbpBkJq18mx/8v6JXnY=
X-Proofpoint-ORIG-GUID: l0CFmkNo9RYzmjbwuXZYf0u1-uEP3gVI
X-Proofpoint-GUID: l0CFmkNo9RYzmjbwuXZYf0u1-uEP3gVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX/YTJrnLUDvL8
 xIKEANdV1tLO5EibvNmceOA1l/1x4mvUine8GVaKlyU1HxNNV6TRP802FUMEShKzii98h+NxFG1
 CqSlVZ575n4dY235J9I8hhHKlylE3EYWBOi8zmfbTZdNbHVEwnAGnWzHJgAJL6rVGdFhfVRgg7o
 sKhm2LE6qgkKsCP17mAhOcm0IcR64DNDSs6FV9gv0e7KZOKT15FI7/FWoLVtT6TVqf5fzGsyR8z
 01a+pwNBuKhnUKFixyuTXXaKSR8wSynm3pwf/w1sWjur54KoPNGNii8eMZID7a59bNVK4xpmqGk
 Kx6Wi46cB7DE9E7wlM7n2uYyHtOouPZv8CGRUzEwcySiyjy5hMnd17pxYm5ccFP7XHDffnuj8y4
 qICT7j8J8W5fcjD4kSDrRinCK9Q1aRQvtZ+zANIgaNvfdRSWlo4UKiUgLW6TVmX5U5fAIzysHhc
 II0tjzQK6Nm/bVKJ0zQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6c861 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cfbElirpQlrRZ6I-D6QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130033

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

