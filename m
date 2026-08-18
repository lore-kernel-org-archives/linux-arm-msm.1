Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AAD477985
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059702; cv=none; b=W98+nXAaxP7l/Xx9r5PrLXVDXM1T8KFscwww/69K+p0Y1K+zU6ZX4u72AEor/etKXgds8lUpbgBKYAF0orvxF7OVYxv1OCwbEHwGp+Mx/uaQjZYrtG+Yz+gCH9lN94yj+2QnkbTbNzY94D0E88Z98n7gYeQfVQXo37luoVFnJ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059702; c=relaxed/simple;
	bh=TovCzYyigZPcuqdxaq6mBJ/WhakHhvbKPZIUTQWZczM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+QRoggC7yDPxYP3cOsUMwNfw4hjmVFEtg6ESh+G0yO1j/uuxjgl36znWiF1hPrnryS7VDILiii7fPmBbIxX8wvpK3Ha/I5AxEZOAZP0jKmq8VAVPjTuNThppgSu5HvaYHYLok596gw4bRJAwXDK7bZIiDdICuJTEoM3WvvbeZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeETVJGy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6piz1Gf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeETVJGy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6piz1Gf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQl0X1350762
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZVarPA2YK70hu4oSEiRrCsHgH73gXrWPpCWXncwRgc=; b=JeETVJGyaVyPhj9t
	gV/4cX67CCMJZNX9q/kWAYMbx9FO0iHexa7ALp9jywM9CrnL1sCjG8lo3EiGYcxe
	Q/oh69qaRnfCHwFX9EWzhb3rnJj57B4oPTkinSEb6We9MNlgKB7dfChjOazC7vWh
	ysGICi37Dcxr49OZb3fwVyqCCmsy8ErmIQGnyrSYFvSITP0PTnwIrVLyAiCzDvj/
	kGlaw9BDW6TWvS0/8W1Ea376ueu3vPHhc42acB3NrkgmDJSmDSe2ZgRP1T91LY8e
	UgRKcTDO5Vse+MrRVlQMgCaOFF37Yl9bIGrZX7dzAssxHuonrkOmMdGnE3C5DwXH
	7KORZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb18ryc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:28:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso64485051cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787059699; x=1787664499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZVarPA2YK70hu4oSEiRrCsHgH73gXrWPpCWXncwRgc=;
        b=D6piz1GfBPJJtdXAz+YrOYfcX6c/VSzVsdZYkPOrDQHZIK/+0Lql/jvSH0560CgD7V
         +wRY/ee5pKm/gMYy3NjIlj4J+cNY1SzXe2ZpyIv4DoVtDGAB79jSCig3XPE4o7ToIHZ4
         nEePUM7R/75u5nYiN8T13l1mEbsNLpCwMfYoaSEf/OpOYevukz87M0mGal11RCOHDgVE
         WK4lBw5PN3ZRBz2BvLFJ+HyL8Vt8NYVf7TW9UQtHu7fSJpWN/A7n8fz6aO9VHKwI2h2q
         9P9Bc9fZedkKfQm6Od6Tb9gYNIQYbiZcd1IbLNujIDV3foLq2ifjJGnRO+sPXvYSi1Pf
         zpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787059699; x=1787664499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZVarPA2YK70hu4oSEiRrCsHgH73gXrWPpCWXncwRgc=;
        b=gjFNp3s3ZbgIVzJDrFKNj+aEwnK1+cd+WQuUUXVOfQzp6saPYJaH9+142aXkmks23k
         qOFrgzUSxReVq9DbYI73yE7rmoP/i/LWIG1kdanF5+i0G5+YP4tO2DIXl+eGuKY9CTEY
         FkFfc2SubbrsQfy+RIR+azeAfVJU864P2yvSpk5LRt3agvDuKG/UAmvSQKd376Ohmvdl
         wjtAAHF9Yw7GLqQOKlMTyQMRG+oTRfFO23fiXEHUYVqpq+pOhI9sLI1GEFqi/ca4Ovrp
         B0V5QIrrlaKXqJLRdLKx65C2Do2cBThn90/CUd/LAXq1PemLaBFqsp5b1vder5NASySA
         JKcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0JY/PshqQJszsR6gH9d8i7Ng0+ivVg2MMaxlotSqbqjKftMDwWfc/ZQ2XtFjeemEcHhDTzGNHaWsuxNT9@vger.kernel.org
X-Gm-Message-State: AOJu0YxWqJwlGn/2IhMHQwe+jOGl2G/n3BtWO+OFma77tozudleNbOjL
	vwFWc5TkZsx9ICVlxVFA5Qhh0UD57JvpZdHcsXfMKo2tkHAgqgucdWKCvgPFrgNuwyCC5l3OiLO
	BwVo+gtfODOk2l9sHkB2fRqymceCBZxbu9ZMzn4vnQWhl9G8ykGUX5NvQmOTxNLGXxvZW
X-Gm-Gg: AR+sD12yLdALZwKzBEtblzIB6uCzZgLA/lCxuw79i2JXWKUQoQ3w8eLAqiXkYSTcSWR
	ADHzC47zoSsP26Q2g2B06f0r/zWWyBALfofInsRmHnVs/83LHu/mmUEzBA37NoHWkLnwqmE7ROP
	Ofqe9uR/WKGY45vTHOsb1Jag22l601KnIkXsI/yM1jd9CxUjtWimeAeZ3OljAwTI3XJzvjXqfv/
	NN51GwB80Ez3t12AyMW1sY8EJ1gR+KIrRRiBPgjduL1B2xC/njlYNcXDSi8saK8JKmvzSYPI/fP
	ys2X2ERM7h8cn5fp0GqnwskSZ4ENDGSDHpdb00y0M9mUluz8jbHaMaKk1Nb7eL/yjv7RxpZBHnx
	6x42bTDNO5yDIiCSKufvFx+xBteH+e6AzLQ==
X-Received: by 2002:a05:622a:1b92:b0:51c:849e:e222 with SMTP id d75a77b69052e-52d854affffmr293763571cf.36.1787059698831;
        Tue, 18 Aug 2026 06:28:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1b92:b0:51c:849e:e222 with SMTP id d75a77b69052e-52d854affffmr293763021cf.36.1787059698313;
        Tue, 18 Aug 2026 06:28:18 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4580f611sm32304636d6.6.2026.08.18.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:28:18 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 18:58:07 +0530
Subject: [PATCH v3 1/2] spi: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-1-8b62c4bc2d21@oss.qualcomm.com>
References: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787059691; l=1581;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=TovCzYyigZPcuqdxaq6mBJ/WhakHhvbKPZIUTQWZczM=;
 b=WgpUCGiLcWxkWH+Cm4TePP7JaBUeDhb32z/HmWuPcq9sRW1HSXtGIsGOnbid0RPszGK9wfMMs
 fgWC+TQ4H2fCf5HCm4+OI1c7AZxQeHGWJ7xzJuyTc+PhIsX1BAuqafa
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5OSBTYWx0ZWRfX9VdjwQZr3SXk
 K2Rr2Sq5vwacZ4c9wxYZOYd/66eL2/EnuC2B1RVLcPHKzoNrp9e7kRSup+PxqCKXTX4JsdsM7Ym
 wEf5tLPp36IKwclVXDqWtvzgHsHph3YSwm8z1rZZslLGcLOThWT7r3A7wrtFynO6WVSKzzMHMLb
 UFJsi/cgYy8DL0iHNIqUyNo7YhGPT1t59pKHurPP4QRA/XU9DELMoxDpgIzG4DKJE/czX8MrLLU
 v57VO/IzzP4BYTJgmGwlBoAG7p7TPRtWqEBhHYJVSgobJfJ9WsmsLWQMrDPgKTWnrgBea2wGMv/
 +mdsonurVhSpaR+l884RjaAWY93KprA/e4eFoVUZQH1zUVhDSUMxCADBSQ5iRnHq12o99Kq0beT
 C5aPMbT92UGqiIWdZJ3RAcYC5pfQCsld94yFMUg2NuRO/SuXT/aAc5BdbHo+JNcgrDl3C2xUub9
 03kZCT40igkREqzfwJg==
X-Proofpoint-GUID: MCTdg0bwCFw1lQKV2D4zKULLusFrgJli
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a845df3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Bb2fkNEn-BfLECvCvWMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: MCTdg0bwCFw1lQKV2D4zKULLusFrgJli
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5OSBTYWx0ZWRfX8vE3aR2xY12U
 N4Jftg+vtSUc7wb0cBgJ0Qu3yygzpb+4zFKd4Eyrg4oS6jvDVb5eMAh7/RBgHAJIL4O94DlM3bv
 xHwvW9Vf8ZGvAzs0skp9vvvQ7xnid50=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180099

During system reboot, an active SPI transfer can leave the GENI Serial
Engine in an indeterminate state. On VM-based platforms, if a DMA
transfer is in progress when the VM is shut down, the SMMU can raise
context faults as the DMA engine continues to access IOVAs that have
already been invalidated during VM teardown.

Add a shutdown callback to suspend the SPI controller and abort any
in-progress transfer, ensuring the DMA engine is idle and all IOVA
mappings are retired before the system resets.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6c57f8309a3b..c65c1788325d 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1066,6 +1066,13 @@ static int spi_geni_target_abort(struct spi_controller *spi)
 	return 0;
 }
 
+static void spi_geni_shutdown(struct platform_device *pdev)
+{
+	struct spi_controller *spi = platform_get_drvdata(pdev);
+
+	spi_controller_suspend(spi);
+}
+
 static int spi_geni_probe(struct platform_device *pdev)
 {
 	int ret, irq;
@@ -1241,7 +1248,8 @@ static const struct of_device_id spi_geni_dt_match[] = {
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);
 
 static struct platform_driver spi_geni_driver = {
-	.probe  = spi_geni_probe,
+	.probe    = spi_geni_probe,
+	.shutdown = spi_geni_shutdown,
 	.driver = {
 		.name = "geni_spi",
 		.pm = pm_ptr(&spi_geni_pm_ops),

-- 
2.34.1

