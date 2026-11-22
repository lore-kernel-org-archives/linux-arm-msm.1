Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316199;
	b=WlX9zw5hqYq4GGG6WTsBGoNEOkj9712MFbYnKKO1fYDHrM++WYGSy/LWRXyDO624Li0s
	 gYHz2BvGkMDC11uyt5XpGVggrrVAHotj/R3o3LN4lNUuld44EjDsqOGrla2xxiVH4RHJx
	 RyZ17JkPW1h/2VWIlDEXrM3aXSX1dAeyvfAssKzxZVefnyzCb771tvedUNJ819NHdOYxf
	 QBjvabsZVVffanXxVo105YcdfmUKiazKaLIVURg7f7nISHdnGLAYk5Ir96ZXTxKXvILam
	 RyAq3A7r3U2uNM34Ar3LOZoHau4fUHRxBFrGPaSti7sDjYVv/T1icU7P0mlWebSIIqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
	b=M8DN30OjoZgenDuiD2yC/eGyVv9RnpPk3v/ES5CKdespQIDYzGW3cwgHwSRw/dH/m6o6
	 olvPL8UGDDREtZZnZRDNWfCbvHdyuYFQ9BuS4RNzYleu/wmJ1V20GmQyp7rlre3oUv82O
	 5aV3QoMvQ6Y7eKRrIvqwqzj6rRLUsZpGE9fSPplcbW4IJ1aSEYn2taO3cqtK1mkTiK/i+
	 ipGyijCr6U07SptCkdsGS8x2mQq+jLruN5BnxEHQit2FzcVA8lED/JFrxIcUgXmJ5K1Br
	 zwXFW12GpqcO8EboRaiet7vyOjdI3DwL2t6lfT1z6CZeOpUZNGkHykktkQT5f0EqeUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQSI7j+K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=geHvC3Rv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F1606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQSI7j+K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=geHvC3Rv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08PHM1034225
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=; b=RQSI7j+K5A8pmUvd
	UuJgvxgYgSLpodMd+K0ODeH3uJVk5686TTba1lHpmBjptUjPztoYxHh/rK58ULIK
	iAx21OezOkFDDMGqbL5XO/zkRy+RHF3bcOl81DWKbMlYbyy2VzYIBFKEKky6AewB
	c7D3PJbKx6Kq1piJ3THI0H8NTdXHu1AeUPBRxMSwKlkQZ5r/xriANaSj6iEE/2Ih
	1SpDdKJLHBhzP2ctCnPGMOOSgE/rocbd6qi+X3SufSgNLJBqOenijFVVICMt1Y37
	sZ7yPLZ+AxGEGqQ48yMUfzyzaLlXkqudPk6Ahxv88jIAc4SNMQB3AyUmA6qH91PR
	AVfNyQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka2csf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:56:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso7154703eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316198; x=1795920998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
        b=geHvC3RvsPWTF2AB5CXrjmWMaiAznSvPL0zQl5JkvVrtj3sugN4gAP1djLHNaxriHc
         WtYYFSdu611iyWVT7iDcU/r55loJKX2HVJ+9CH5fwIn3/eIN7iGy0enOhCLQY1vofqkm
         Pg4ZTEFsjUtOjLlUx2jsOu0kSfIF6dwH4WGfvdDiRJ3lonu9Z7tAra5k5H5zf4wANbdX
         ccXQldKuNtCLxOjMieBQ8bWEjXxhdjG07Bohj2s5Y2cDWiN+ShNsGtfbyiBMxrWPJivl
         oU7Zh8K67UjQv9D4HAJp8H7mZy07k2fC8j6HXVuGr6kNd0J5W/G1+Cy/20/8FKjJJBC7
         zWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316198; x=1795920998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
        b=hL0CsjJ5cm1IZRwQ4O3Yk4pvu+NNl9Tftv5T9BbIsM0Y5jugvPzdMegJdXy1JUCjN+
         vfj8+4z9q+dbzFd45dpjYkQ+j/uhvllDxugdRki7AQkPRcdoY/+bnKGz+bGiXa5wqbPz
         +PJBHOr8BxaxuSGOG756a9mlLKIsrH4SLF/KUELWzZXZ9az3YEt8jTH6Ra8LbZWauRVB
         nS2IN0QhdiKKY/ZxesrOJRGufnUmGl7G0AZnWhgSudAUrnQnpQV/sl2FI7uFPXHhmF0q
         N/fayPJDtVAFMqXPy6P9oGxgM7ZM5MaKm+Nkc1V6S8Ms+W5wGvY2Xok3mJSGKyyrF3eE
         C/Rg==
X-Forwarded-Encrypted: i=1; AL+hErGKmkN4SwFe0CBjnBJXHFu9v1SVnWZeIenyKzPuD5irCU34qSlFEkOTeAMfFN0ZxOEX/7aGdjEe9GM1kKpW@vger.kernel.org
X-Gm-Message-State: APuU4Z8APd+JULj99lVAIlfP7Ov7sedAd6qwzMcT03fQDRkEGwg+5u4Z
	oumBVMrgdzK1CN9c5CmgJUzP20knE5tkZACwBsjokyrroX7LNCDpoy4wROg01XYo+6GSniGE+Ha
	yl/0wkZneeB9nR721unQSKTPOqkdcfK6SJZE51vsvHM6ixPwdCFVWnE3FTgpm5tuQlRe/wsPtwy
	6i
X-Gm-Gg: AZFdTZfMhWKPM3X479frVW9kzInSzGDl1L/7mMs3NMB+dImRb9jZAf63F6vMwq2fQoy
	ZW+zFnpx7VGfeYOPOYbbUcM/0TLYXcIgZ8W6gk425k6urn2TlCNL/uVTvWOWaeMVnsJbGZEmOvF
	JRvXGPrWvoM61L0/lneA1oI80vlk1W5CBgWoa51rAe5yKLCYLBFxx17eMmU/7YiHEYlPACltwnO
	Fx9n0Q3gzEvr6qv/J36HbK0Vcq85u1ALk0Q8r1CTJeeJhUt41uqXtfrPwxqv7Z5Q7nleZkr5W3C
	w0PqE0Uegta1o+X3phze9Fr7ChSHrlwvRwbpPV4EoVdf2n7WuDcCcmtX5TjNewxhDg3re+zbTga
	oGYWARuat8JXmUHNW45zKr+UhBh2vGudM5Oz344VJ1AyROUJ/6Fwc4tOFqBThwh6K7vuM92pCMB
	7ufCofVztF
X-Received: by 2002:a05:7300:d788:b0:386:83e2:a8 with SMTP id 5a478bee46e88-38683e2019bmr6001425eec.40.1795316197960;
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
X-Received: by 2002:a05:7300:d788:b0:386:83e2:a8 with SMTP id 5a478bee46e88-38683e2019bmr6001400eec.40.1795316197534;
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:14 +0530
Subject: [PATCH 01/11] PCI: epf-mhi: Pass the actual number of MSI vectors
 to pci_epc_set_msi()
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
Message-Id: <20261122-nord_ep-v1-1-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=1340;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6lmFv0LMj1kepMVfDNDhSTwXYq+rLdkqa0JXEDLBBAw=;
 b=tnhk8AOWx876pmrvroA7ZDRtfUiwnAUBPSnRNygL6UV6R/OUsYeZ7zAh7AZIjO3nYJCs9xbPf
 pQ7msA7ylnuBQdZX9/LqbRBB4npuNlgQ/QymPj1mWjJOZcAVYnUpaxl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX2Aqaz8hNwmBo
 Mwy7gTQbRrqC7SLnemOGOPxAaAcPsYe1NRUMwXMYWBwvHjei3dOE5TDPm5wZCixFancjnN3QATr
 cqZo+5+2iYPXVE/i2m6iJ6UHY6vFPPyGevClLVzVyz7GUl69xFILlY0Xw+5nbn/qYKZ2fV6Rtq4
 XW/o+lod5ScdO3th3/ZUg6/Z+Dy4wVTFCnRqTySY5rZNivfVDLQ1jA1u1FzlKYwt/jVMK0d4WCy
 lg3jS4HPO6EE+HUPGvTOgOy8EtCOqcyqqwzBedL5oR+wsexTjVSRcstdEwB3vIgGI9XEU1XsKg8
 TgadmLogRCd/prMOSjNYYyfoG0+h+7dLAH+s3ba89MkG4vNf+BczUOOA++VSHTMiVXS8v1RLLkJ
 N1rI1BJ4hEi3GQAM9yDTOT+aAKREd+DN+VMTpNinI3wV9l8rKQVdrOWQpPZ6QPQ4cP/+o+2xeNQ
 0+HhVg19R85BTMQBVHw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b0259e6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-BGyM8POLA_osPWRVsoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: h1-S6Re1Krp7lbLHTir_zW2wz8kun8fF
X-Proofpoint-ORIG-GUID: h1-S6Re1Krp7lbLHTir_zW2wz8kun8fF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX0qFHHrwlgirg
 XGs/jrplp9Wys9/gp2V5URF4KtxhmX6CdEtMVvek6JIBcIkJuKlompgRwyiGmuJNFHwbzKgkLdA
 wX61CGpP4uqPAOUubdFOTeaJGO3hlAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Since commit f62da6e7270c ("PCI: endpoint: Align pci_epc_set_msi(),
pci_epc_ops::set_msi() nr_irqs encoding"), pci_epc_set_msi() takes the
number of MSI interrupts directly; the controller driver encodes it into
the Multiple Message Capable field.

The MHI function driver still passes order_base_2(info->msi_count), which
is now encoded a second time: for msi_count = 32 the controller advertises
only 8 MSI vectors instead of 32.

Pass info->msi_count directly.

Fixes: f62da6e7270c ("PCI: endpoint: Align pci_epc_set_msi(), pci_epc_ops::set_msi() nr_irqs encoding")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index a633e47edf2f..52cfffcfd5ca 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -730,7 +730,7 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	}
 
 	ret = pci_epc_set_msi(epc, epf->func_no, epf->vfunc_no,
-			      order_base_2(info->msi_count));
+			      info->msi_count);
 	if (ret) {
 		dev_err(dev, "Failed to set MSI configuration: %d\n", ret);
 		return ret;

-- 
2.34.1

