Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805359;
	b=h9Tb7CAxmOLd3l2xC+u1nDvzHgDfZI4pMnivPUdvRh5Ek2HpY2NiLJXkrLi0hjUh4vfh
	 Pa3YyG1aowx1mMSCXFhp+cBEIYiNrd0jaYNff8igvVw9GaU8tHva9Zr0U5jzWnye6qK14
	 7+p2+sA06FPsHdgG2IkRlYYELCI07j/7Jt5VWeJ0seCN1ssmlGIbJqH4K0NnMh0y2VGl5
	 i2yOkOTHYQALUnbjsc0NJBOYo7zf8qcgEGeXD4Hms5TMCXtrqtQI5Dr/ZfA5pNa9OlM2I
	 FjkrZrC9OaWPuNgsdZarEQ/rONdybqyGknmMgtLXfiQnSkFEuJheKl+qkjajY/nmgug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQDvChBBpA=;
	b=0MZ2kWYBDnW36U84StBxQQOmhS0Nxc0mhZxiIeA9w1cgiqsj5HYUlmOaIxLewV7Bvuba
	 fj70MhLBaaXHmJyX1c6EepUXe0o3rfjt+g4OI+NeWGOi+LDlJ9piwQdsOzQi31+2GB+9T
	 SK3R9913dzYDPjEK1ESG9QTnjgcbhOvQ9R7dmir0t7P5z6KO+B/rIQqlGXEf8WKFWPfkI
	 thcIZPpFx8kuo+sqqUlxfzDP001Api2jYZV8TwGiqMDvNUga7Ijw791xCSJNcJifP7wpH
	 87VBH3TTd+2fOv5RToZ5+prq9aX/qJjJGqRCN8xnRLH+P/4XO4l++qAyQLkXUMUIZVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAdL1m1e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfq8ha61;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327B606D80B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 15:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B327B606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAdL1m1e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfq8ha61
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4EHUQU2016631
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 15:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQ
	DvChBBpA=; b=OAdL1m1e7tCooj9OIt+x9AEFxJzyrptrgoZgFN2MQGDvmN0DNrl
	9Bj4CL+atIm7xLHPuZ6tQwxUp56OjIvQxkZtAWx0cPwU5glV8sRsUmozsumaBaDE
	elAXR64+cPpSfaJYwl07gBBW/YDEv918Kofmh6vmuySFHZUI/aT3ad/MEb3y/R/P
	XmAILFQUDLDXy4MhepYRJ69aCu6cMNKRlg3Q1Nmio+WQHeT8LMdx/YFu6ExqbtCN
	53Rdy7er9VllNRakLdlrmNHfMu2oK5iRXHNMksBpQneqg9MTAZolSxfzSvpqElo0
	h9AMmVEsoEumxZ3s01LiOmDVuMHCSOkkEfA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdr6qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:15:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so183327241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 07:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793805357; x=1794410157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQDvChBBpA=;
        b=kfq8ha61gHAX7duIP113CuxamEm8AMZVPDeSfwjcQmC1DYIrBBQr1I5FfS4Nwo4+fO
         AcGYF+uhtyeaUbbWL/ZkGWARffVs1bC/ZCRaO69GK2vEnSrpKWPG4dZVpnMYBjLW+VFs
         c/htu2wn1Af1IJGsQMq12OjbK+0PscbCwCb6luE0Aaf3KBn1Zm+muBnWEm+bwWYd3zwP
         tVK30bNhJieAw8DjJhc2T745cXzDFTiyBLPJXx9kWOfrZeJgqq1FHfn0C/sPYfvOQBIV
         VbN72GQunqVxuLNHneRek4gVQinH3HLt1yJoCvheanXtZc+hhcxTebshZXgjPn6VnSEQ
         nF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805357; x=1794410157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsyYfy8mRvC6Ia8wqa8pYvudHgL76D/OhZQDvChBBpA=;
        b=hswh7lDzILRD3+ug5hV8BfBFS5+pielYa9CSec4x99OHMrJq83J9jpkHBSJxYU+tcv
         vyrXk2pYxd02MZqPqiAFi6cRToyrHPAamD4jx7n8fcEILdcGX25vE6Z3oYdtRJ8kOyrj
         MsmBynnplENrKFYCQMVGTrzSWcii1OImUm95MTklqRauuvs0xpm2cE9heFcd8mwrh8mu
         IpUp6izYlBQVEeZRI8fPMLc+c0P5R30dvw4VwkBGmXUx9er/Zd8p9m1a/BiVopnBN4zK
         Ohh9udoatRA7tnkb8Oz/NsSx80ctZcbSu14j+hEZFo0tWmQd0PiF8sQJYb+V+iWxMvf9
         laHQ==
X-Forwarded-Encrypted: i=1; AKwUvByXDxrAo3GlKFm6boCvzFDt1a0UmmmuiGlJ6SobGZsZnJcRDO88W5/QWA534Gv7zT+wBRMDGZJTaZ3Am3tc@vger.kernel.org
X-Gm-Message-State: APuU4Z/oQslPQC4NVFvQBY9llpAZNkcK0S6b9u0LjySwGLqnLFBn+YPI
	h2gSIdvKwcMp0crRwb2lUmXmYILJPZ/XckgDgbXIUASXfZrEAI5UK+JwevLt20nMM6Y2lU8a7Tl
	hKUEcErAXWwWSk4LfDHj8m8/56X2Ezbik92sD245WBH8zVoRsLvri/W0oIMt95qxVSnSC
X-Gm-Gg: AYBFou0f1KAPj4UeHE1ugNf+iM4wp+InoJ0T4ejhK6P+8QZHQQ0b2xTDZw3qWkOUTr5
	emZXzxA2HYWZLJLY4oCcal8FRgHmeQcshSJW56IgYcxKnJ2V80DOH776fjzn3rsp1pSm9kKDLYE
	UoQZxt0PL+YspWGZZQu/bmmdZlgK9KwpGcmFoljwgAXrF0wS3xvHvBOYXDVm/0I3cdfvF2dl8f9
	4p49xLfBNbUlhltUG6uDAZVloXVYLBy2C0ZLGTQlWNbbNW6OFXdC4IhUHAe3j1kepKbqIljSw4Z
	LT53yVSA/3paT388MrV5oaOpzyHAm94+CDryEzmSthfR5iTdm5T3SLLXLP9cv5RapdO8Ree0d8B
	Ig4n3fe7b6SxTPyzkECxIQ1HLnjVQnnfMwoAxnMd1+FCpiQw=
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d072baa450mr5990196137.10.1793805356645;
        Wed, 04 Nov 2026 07:15:56 -0800 (PST)
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d072baa450mr5990167137.10.1793805356115;
        Wed, 04 Nov 2026 07:15:56 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm134321875e9.7.2026.11.04.07.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] soc: qcom: cmd-db: Fix probe race with possible ERR_PTR dereference
Date: Wed,  4 Nov 2026 16:15:51 +0100
Message-ID: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2576; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=MQcMMyIyhWEipHgYUA1kmj8xFsF8tkr+QmI4/dQ61uY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60wmqGr0SYcw4CYMyCDyvzNLSYOvICMFjA769
 ULwEeTog2+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautMJgAKCRDBN2bmhouD
 16yXEACN0xBTQvk/FRE3tbvCH0kH/685JGYvunRPpT2wvdtFYO5XSeN+Xs4Tl5HrK2PMxablDto
 Vij0+JWKhHHFj5dd9NGKsv0QiGKicflwC1LCvZhIMfxp90vNSGzk3osxhgiEQH9kKVfDPDO19pU
 5c+wILTIwz74I9Kx7NLginJl+YouQDyox+V63KpWodhh1dTZGjdHKjVfeEZouMj2uG5e2lYUlzT
 luBZcOt7Id4567asZwXC2LXBQoinUAV9lfTKst0Cgmi8dSPhmw2NBL2nPS3YQmpkPoDwpaLP+6B
 UwGjfT3vC5Yp1uL63Kz4IprIDKScp2MHEHYkSSrh1Mbn7HF0/sXnvH45IW/dnoNBSbDR5DEmlXf
 3KDlwduhrxGuEt1iIQPF5fYMGjEeVUGxQKoptGYb9+WGUQ925xWsW7SRHsMz6xBz0HuQobadecO
 MRsSHLathQ9vk2LWTpVQzFTeqPPlQ1GiMydMXhS1kTPpBwR8N5z/Ya/+EyGznDjDwzSbf0aC9Bm
 rXYV8dwKHg0yYrkGQTICpeNMkFRwTXSx5xg39my6su4m5F7jbrEiH1HBQnn3NptHEiWsMrBEvw/
 VDRzjRMO/6FIXmiKZxeOI6oYCENM4zmwuzJgJ+ZRpLCE4Yx4hm9moabH1U0GLcp4RyzJufwPzZ+ MNrsnO87DQPDHtw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MCBTYWx0ZWRfX1b4hpF78pfRV
 NOY3tKloLTB+IjHRmsH+PkXlbscYwczcPk82XQHs51zAx4u9Bfyjh8/hxkzPU9HlVrItR3oAvD4
 IR9ScPLFvVpRXVtFIXNOFNwNcoGXygg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MCBTYWx0ZWRfX/ce3gZpF+r2S
 9WeZo6g3u7t24WeH/3ywiZTxaoxiUXCmhO/7v9ldcsox6GsGV6EXoKmpCZ20q1a4BJmz15VIGy3
 cl5ZljaklMJ0i+HAKABw56AajDB3j1bgUhdJ/ytgGgB/MTNqViylfSUk3+VTNZ7llkizkFW064+
 yek5cwYoR8SrxhXi5VoFYJUKq9IzCMVF9YoYMfTEfFHVz6e+z0L4jRwqrSjb2yJ0z2Aelcq07cA
 r31J+essGr7Ydj01fxjQhSMQ+MnSSw8YfwlYPkxycyVk4+r+wAMWIJbDcU/x5U148NX1o7e/zay
 BkWHDjpI00+NaJo/WRTncSRVPK8dfOgZfCbOKJK5bE9tzzfHO3HGvxNynpMRq8bHsrULz0DFmLB
 YKNpmY8pa7lTYxIj3iV5Iy8wYqwHl8SW/pOjEZF9U4Uwv5MMAJfAO7UKA6JR5JhGhGVLXfon3F8
 82zcdEHS5AYmh3GKLLg==
X-Proofpoint-ORIG-GUID: pevoLttRLYt6_7fqVHB1PbtiPV9oFAgo
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb4c2d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0UCu7NDXrwntZz1bfdkA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: pevoLttRLYt6_7fqVHB1PbtiPV9oFAgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040060

cmd_db_dev_probe() stores the result of devm_memremap() directly in the
global "cmd_db_header" variable and only afterwards validates it, which
opens a very short window where a concurrent thread could access and
dereference stored ERR_PTR.

Theoretical (not reproduced) race condition could look like:

  CPU 0                               CPU 1
  -----                               -----
  cmd_db_dev_probe()
    cmd_db_header = devm_memremap();
    // holds ERR_PTR
                                      cmd_db_ready()
                                        if (cmd_db_header == NULL)
                                          // false, proceeds
                                        cmd_db_magic_matches(cmd_db_header);
                                          // oops on ERR_PTR
    if (IS_ERR(cmd_db_header))
      cmd_db_header = NULL;

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1e6d9e1c-b97d-447c-9cbc-d874a0609918
Fixes: 0da7824734d8 ("soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..5d303ca0dbd0 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -340,8 +340,8 @@ static const struct file_operations cmd_db_debugfs_ops = {
 
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
+	struct cmd_db_header *header;
 	struct reserved_mem *rmem;
-	int ret = 0;
 
 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
@@ -349,19 +349,17 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmd_db_header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
-	if (IS_ERR(cmd_db_header)) {
-		ret = PTR_ERR(cmd_db_header);
-		cmd_db_header = NULL;
-		return ret;
-	}
+	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
+	if (IS_ERR(header))
+		return PTR_ERR(header);
 
-	if (!cmd_db_magic_matches(cmd_db_header)) {
+	if (!cmd_db_magic_matches(header)) {
 		dev_err(&pdev->dev, "Invalid Command DB Magic\n");
-		cmd_db_header = NULL;
 		return -EINVAL;
 	}
 
+	cmd_db_header = header;
+
 	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
 
 	device_set_pm_not_required(&pdev->dev);
-- 
2.53.0

