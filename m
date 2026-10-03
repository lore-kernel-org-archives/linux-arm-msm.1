Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C70395AC5
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018155; cv=none; b=TArNEzML9qxV8BrobsPy4Y0DhgbtdbXw4m9Mfh+BAjhTCmJyjW9IgxEIwdNoXFVHkBm5a6JkqjrpErBFzIF2aOwlQQnT8FUiGT+6T4Lcn8T867qsjXkiUdTs2jlD6ORGdOtIwsu64RCmuTfPHfH8S04VJqlovTQb9Z7QuJgPmgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018155; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFyAf133PuwvU+dQlMR+BUrK0en8i5M49vuqPUcT8CpWg0mxBOZME52JiyZTgxLUzrgrA01hlmPBojJsNtGQkSPnexVqEHNh5RadZ3tF0NT0XX82ucMZ7nVdfODYF09Dj4pKgHGMpyybPQzidbn8fZ5i2LSWt9DXcuFP9PdWcas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogMdz9dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfhupzPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogMdz9dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfhupzPr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933PXc82956621
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 09:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=ogMdz9dtnkNt9NiF
	mncBgZrkk/PbUD9dUTBN48uxQKZ0MjsE+/0BLq52kGWwc7i9SmWmQzLIkrHFfnkE
	Nk6ma7f+QHUDePJhOclAf2h1ztTTDa7MKGIzHhTf5VmLTjKW9MBTjlUx071rwrlc
	RuZC4foss+uuuRfWLTy/9T8hqGtqP2WngEbmDbulTbM+Co1/ml6oqQWWtQoWqDF+
	d1ozFkMRi8fUZ2r3llKFKziBjARrkFFbd/J001cC3Gw0umXEPpaXEfJ958jeAz7D
	brtcH9Hwyq0ZqX2hgbXh+/VfTh6e0eLgH6JwuWDy9uUMkDm2og5GozS/+X0gj1lK
	nPVFuA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu0h5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 09:02:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so731342eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018150; x=1791622950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=dfhupzPrsz73Eq+JCKZhojCkVafMtx0PiadT88EW3BeRkoGgfJezpic5CNM0HGFFgX
         xKCuLXuZi3uF83fWs8Nw6VMTpu8t0t8j+VLWZsdD3M0/WMFXRJnu9DRkGwsTvcr2cOCR
         wmyRELkYetBnvGuODxzlL7TxqBIbMJAo4TNlehqDovx5pIW/hCfWjBQx0tlni1PpcfNs
         VV9+9j3wL3FGMdHBecuU+eV/j7QpO9ICNSwLYNXYd/EjkQTF6gz+iFAS/CgdDtvBq6bg
         aLYL7NNU42acNmh3DMVNx6snPcXbDPA3hmHkdvdltnm++IpPw6GSYMqlHNBgReJJTeVf
         P/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018150; x=1791622950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=MvGLHEzOXpjcEmtk7gKJ4JDvENikBGqCssqbAhgXOKq10ZqDHKk3KJsnqpYj/JrNJw
         eedRVfEfmabsnwJFLQmpH6C7V9P9iznLVzL29oq9+CqBIfHivntEpzozjO8kYHEE5cp4
         zPTxr8oA27AAHHdoi/B+1kv29tPX4W6qtqkwGHOcCQ28lFv2yEYd7GTeThEkgPJbbZs9
         osiIsEMf74jHXqSSbbWan6xHGl1kir8F0VUafIEFCXeHSmtJfm567I2+aNGpwo4m36A/
         MtmXxRpmNES4I+vg1m5iCp7M6+cr8PbsfwB+1qTmgynr9Q4L023HPeVudDszxANiNdcy
         OzcQ==
X-Forwarded-Encrypted: i=1; AKwUvByrzXCpVmaYuBMglivHIrg2HuGPp9Hr0bDfXRCB0l49bPE/ceSUktaY3Sf0UYpxNQL/7lVHouskhigXhI/T@vger.kernel.org
X-Gm-Message-State: AFq9FYKS5eaErz0N+X5vOIT/yeH/rXsOz09kXlg2nCWC5ukDmxuJOlsr
	4DITDXzOGr+QIeb5prbyteJ1zUTJ0QeKh93DU8s8dAsFt8HSaAHJChb3ZY+5tvlJO7/a2OfZQx4
	r7MoPi25UcSDdpdfkDqlBw/qCnbsUFQ9jp2Tv9r97eVfnFOKmidw2FcVuBtEPSPxaeLwlyAFlqJ
	yTFuI=
X-Gm-Gg: AYBFou2PpZZqb1rgTCS7i6ld8IeOPDn8rpwXV4j7a5SSYLN2fp+e/BnE4qJi5ooGIj7
	O2WwgppuR0HckmKxeZzTi7m7NRNbBIsIo/CqWfLAMsqlhLmQnDd8oY6MlzsCbxD582UrfLFoaIy
	JCW3DEukRmTe28ta6SeV/juMbDAWbyJG2n3xErAui5x/7zIw36AT85UT6/J+1dUZOxBdQbF/hjo
	Eg2y/p3BaZO8Axj+J2FWRH+nJ5+Z9Gf0tH5oQsoeukFOf+xJQclwgfaXQW7IZLd3I23uPwd7nsj
	AB5OqHUxiMmVB2h3RJAdHos1uH6celgKmoWHw22pXlb+yaa49vFUrT0qgvxnx7aVQwoTe4eb/Mj
	vXjgcvEwtPDXwidP+NnjFOrTpuCGqBOA4FOwWn+BMtC6dImWpfRzj4+vpW008SWSk1wYJ+rGZQG
	gOMnpEaEamtA==
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24962eec.21.1791018150111;
        Sat, 03 Oct 2026 02:02:30 -0700 (PDT)
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24919eec.21.1791018149567;
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:12 -0700
Subject: [PATCH v18 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-1-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX5i6PO8Ts9lE1
 8hiXh/OoBn/5PdFRGZM68ecpZNiCS6H/ZmJtX0rk3Yy0Z1mc0q3VPm9UqZbk0N6TTPj14ezn++b
 bARguYdQhYZO1hG+ypB7BihDpnqYOQcMDWc+nXHkFUXCN+MGsQ+7GPL96PrfKdOhCZVWeqa9Gsr
 JHtgAGAEMfrJ2ybvCISXPzHr00pBU7sppKce2OYGHNTmomGUbc+3fCk+zKL5UGwn6GAEF4gxZly
 UCWLWZD0soWSvPlJEDqZO0QvPsPLNKntQeJL2eqRTf6v8dreYzx05Qd4aBupRVe0nQ1l7ZOPdGf
 oFKnSBiVJ0+C19FFP5TH4gI9vwFuz7479WUpOjO4tlXwDo1kac9Cc3ULjabfWygkI0mBLGkMO42
 cHIM+r1yvYwwi13lPVM/lLWWmZxow/kuP3Jqcd6Br5njjZCOf43qwrVwwihnZUm7zjV8Ub4gtbD
 q1mna4iVCsn2khPO5Ug==
X-Proofpoint-ORIG-GUID: bayQDOyRhbQhrVpeXI_luqRC8afieTQH
X-Proofpoint-GUID: bayQDOyRhbQhrVpeXI_luqRC8afieTQH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX8wXJWERU3YK4
 dIx/w32KFGErhBr2SEfRm21L0O+59vdx9ghoA5AMknzsNaM4mSjRLneCS9ZfULweDVmwv0IIQ0s
 PS9YSk4w9VoyA7wyHZcQ/+ats2Ueq/U=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac0c4a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

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

