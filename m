Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355A3C414F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443680; cv=none; b=c3d2mSBMxZfjGOkhhtepQteQ4eHsPsbWLJPE4qD11+L+t2HFO3f5pD7MVTGdwM+x4H1RdL+7EJyNADWuut7Ny461/co8RGvUrR7bynWCeKsVfXEkrFJ9w8sTBgNsskpcjCyC6yfbNXkqV1X067WgT3Y+DyaBvK7KVgpuxw+HJnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443680; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZdkj61DfsbCpIk6XQ98WGw/ol2T7z+WpniYW0j43eJnSRdZwLLtT7EQNwo8kru7wZ3BpyVbIgqOcqFBeI3yGu+PO7WoTtGi6kcPApMOg6hstuXOebqqQQncdIdHPoBeQblRmfbl+GSle4MHJ6dFl3kIQ8i9CcZAGjA0NtSDw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4LqJ73i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBZXTdGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4LqJ73i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBZXTdGN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTfp1157574
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 07:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=T4LqJ73iX424NhwF
	OvaG60i2cpo7delpM/GwgtmTXxSsHL26iXAzduGSNUG7lSAVK3CZXwzQq4iH10sb
	n7PcComUKC3pOp3p59Rg2stI95rSPfJYutBHoOs0uHsPT7P6bz4ZTEQuS+7w/r79
	TGn/LVVqo2O2bdrPyQMsyZaspLiubCFAlSGw4UviVwgaakea0xGF4GiYAlwIfwYA
	sBhxDNj+P0SMtuqiluBjypx+Jcs5c8ohZcUqgr4KVWjAJOwamLCA5vCWoM3ZF/1H
	SAbS0ad8Yx4srzM42b8n0cm2xx4TrxCWkhU2T4l1Fh16xX6bN8XRDY+X/S+L7kGt
	mQ3G4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51nac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:14:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so14346231eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443678; x=1792048478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=jBZXTdGN8qkzoyou/1yHlr1q85VSNqbun0uWZ91VHgaB4FwNLyTn9VBf/mPL3Ss3in
         R4cDUmA9KTvWa+GiFaQaUBa876tAey0fE0E2VvmqU+1F+hHY7EbynK4hMIF/Ufn/lVjN
         lwa+zvv2HGJrLFxD1HIvP11F4kc9pixRs3xRf5/YKtsmkxZwPdTQS8DAEYTkNr3y/mkS
         JOGjekQ48ue2ne3c7Eh04eVeEiUpTo8TN5CLctClk0A+0E+EOkt74wKfUB3aQtjVQQyc
         hF8eGmoxEXes78ietnaipGFjR1SLu3i9tQUsYeZnHzGVG6Yv9Jka3bfmUV1z6vrmmwWW
         sNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443678; x=1792048478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=t4V/3WH99RHJC1g8ZHMWr1AgKbOfWuDHXfk41yP3ckOzbg5qiwPaAh1ZUk5DmBqUzK
         x+5j19iWPS3o4q/LDRLVW2VTJwaS/qajHrCpehVdpfE8SYNnI+xz5SWTmwJ3aG9SZ/G4
         m81G1/2AXFX/nmhBCXLg4aB8llSmS7qf0PqWQSxpI4xX5bqm3RQYFKMJilZ0YlwqzXGw
         iiax95hhuSbZ5bx8csM3hdWvPh/xNlztVxpalEOPyAJ+1Cau0DZC+nH6/NHmDH9EHhWp
         bG/6HhbgmOlO4Ggn+UtNnr4/n8ig0X6ezbFt9yI9DXGZ2rD5u8v4aeflpq3yj/S/X5fF
         3AUg==
X-Forwarded-Encrypted: i=1; AKwUvBz4oqLzqdFfn7mLzDuJ5e4Z4m8Kkkunq+5IvAyQgtAYG40zTidwsTkJ8t8URjduNPKqP7L57Bm/NKw7j6vb@vger.kernel.org
X-Gm-Message-State: AFuF++mCPuJk4MwRDG/eDbJ/6DO9kBUaXk89ZUMDwxT/3EoUupyvd3Vb
	gTXXGJhTxQQf9dqQScKauI0Voq/q4LLZG6eeABf+NRMUTWT124W+H8VeJM4ZR72IWZw/8YiHuCt
	be9pUi2cZWF84nQLssNUkuePiRZQQS2dh8LE5O1x/TD8Z/6pebe0iC+zKYl45rgGRNI/3
X-Gm-Gg: AYBFou0HHP4lH3o8mnPU7Qa9o62zfSIEHeTEb8+5gc+u1L0b2FvU51dGw1dRlgWKgWM
	+gU9icyJRuvlk/G0Kj+a5poBdWqsBVJpc+6fOD7TPfbkxVxrg9gpUo9fl9PBeycE8V171Mjpq46
	FgzDY1oFtK2J2f8Tsout7AYsG50YQVHImjDQ8QCYeVonJwB5zE759TLyWQywesTm4yF6gDC6buY
	KP622/P5P7cCSDmN6dZ+qUCHkOvIPN+IHLvqH8U2iEoY0TAm7dhIcO5LtCfNXFXhBHxqcwfg1tt
	pxj7SmDovSCrJK1yOAJKt6D8/NTweqESo7KPncS+o4jD/WcjgHarqzUM6etUUNWs4l+zNcwOPz/
	jQjwQxLt3JO78AquVuMzShsZyB1gwz82xxG1PN/0elBVQW7PGfEPvo5n3QJG5AxWgtVsLaHfmLd
	2O9ogHNiBHoQ==
X-Received: by 2002:a05:693c:8819:10b0:352:2e15:49a9 with SMTP id 5a478bee46e88-3522e154b4amr397488eec.33.1791443677783;
        Thu, 08 Oct 2026 00:14:37 -0700 (PDT)
X-Received: by 2002:a05:693c:8819:10b0:352:2e15:49a9 with SMTP id 5a478bee46e88-3522e154b4amr397418eec.33.1791443676710;
        Thu, 08 Oct 2026 00:14:36 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:36 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:31 -0700
Subject: [PATCH v19 01/12] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-1-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: YyLt-dPAL_OVzVy96q60JxuPkiY-9oWZ
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac742de cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX3eWp9xgMEvXj
 72ktLrtBiHwFPGLRBKuG7kNo1GiShf6kzGrN7O7F8R/3sqigP9eiTweGvRpqB4kYQsilo9skZ+4
 iyA19idSdUbvMYhOShnGg7+4g04cn5Y=
X-Proofpoint-GUID: YyLt-dPAL_OVzVy96q60JxuPkiY-9oWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXwaBPqXlxO/Rd
 1phGPMF91Y9UkDtXngFbIKzLXViiMmg9UUu5VGTPhhPHVO3IY4TNMnSOQULf7xAu459mdeWvjQA
 VEh/OuB8c5oLn3PcnJrJZRA3ldIho+/37TIONi+iomwyWbgSdjBdhhANYEY3fSPGr4+RgZeOozP
 xCqYrHie7TEHGtTY/JZGK68tCwMwt2tE9DvsW4jRIH6portpu/r5cznLmYiN1UgQJkJ+HawreCR
 P6bIPdtW2fz+hc7IbVrCNPZYQEEMcbuh/GOQSowdHpc48Se5Q+LyfxtrloIhhLN70PhcTUiQNzw
 5B6Q3sUPpoxlOTUQXTLOYdxmm9fwYh6dToFu9TiUOEs0SYnbRX/C72CAexm6S5ckAqgqO4ymeNZ
 fGNOFBH8ZiGCh8oDOBDpIH4w+QTG5BG6bRM9l7l/f/Tn+eR2CkOEhBpHhJ+qVFaSDRKik2sn2Cq
 zW3wt5l5Bfa9ozb4umw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

