Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914BE342524
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827280; cv=none; b=PawGq5dQCox37UKEU0lmBcmuJ5u6vBLedo+Mt+SwsaS80HOk7ER6BQKonTwTbRjkHz2jNwVjWMJ1Hegxzl69vYhv+iaseSSIUhSr50Ae7F5bp4CCnUbQhBv1WbsxUylnA+u052HpOzbAxJ3krfeVP/hGOAf+K3RWziE0l2OsDdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827280; c=relaxed/simple;
	bh=Q5L6F3y5YYrpJvuR8h1skYv9DtKr1aU1rVKze+Cw4JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XE2C73lzW4hNJCjGxIlmKZ6IOdczRkX4ItkfLdUMjonKcwnKJEhxepte6L1kgO6I1KQRXQR8F/5R4VEf/J8qVhMFcAxcDQAZ74ekNrTxGfD4ARIx6fXerZU5kowpaECehR0/Fr3b0N1U7b7n4kun9M3I8vKkXwTdLP3wgYp64ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCo6XeDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwURnZmB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCo6XeDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwURnZmB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDK0KX3674442
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 14:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vg1Pxt23ysh+GHQlArRexPb5cSwK0994P+V
	BXsKz6SM=; b=gCo6XeDuZQHxCDSA+HEJga/uYD2G5VsrJalhgvZ/9/YhJRMmBOq
	NKqb0avNbFLQUHGMEUD/Pgyflp82dr0ZuMAY69hKonr6dXZWoTGs6dT1FEDuemAw
	sjvh1iKIHqtclvMFuJ3VXVtmxb9SAlTn2yCELNg7T53fgrjW5wreplZ/FD3lDp2L
	zL9aG4HVHD7g7MMfAF5jlkfbLlshBKXwLZm4wbwkHY5NsuyGmJR8K9NXjAYeZsrS
	V5Itp1hEOV7aZjKH6fQbojfR8nkEtqb3HXaudlxQXz/Mzc2VU/WoxmJUatdrHxEr
	9rhASFePuVt4IYfy7pFQrc22w4hNNMli2vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqfs47g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 14:14:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0312937eso223260385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789827276; x=1790432076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vg1Pxt23ysh+GHQlArRexPb5cSwK0994P+VBXsKz6SM=;
        b=UwURnZmBK3DLcTxeSvfxnT3FwZGyllS1B9Zi5S24Mhj4Js5h3WytS2NI23WrqhcEvS
         3vs2+K7Cp229WwA0dxTpLURrXp/+ggdRWPHCfOyxWP2C/hq+twhuVwARl2tfrp+xuaTc
         LB/8RfnkopG20zmylH10L/H0BngjFY687JKYeqYy+U0XCcATY/V0UyKVJdW5QTRqv8Ud
         Qv+6HqZo31FX85hvtNTtJSe3Ixx0P+qTT5mjfYQ3BEyywsX/oF7kLee/IxGVRMrq+bZT
         G9qhZuYKyrDYfKL4xixVOq+LV5Q4RbD2y/AuBqbqR6HukNjAXIoGEjxxukGVd1GevBzZ
         NUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827276; x=1790432076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg1Pxt23ysh+GHQlArRexPb5cSwK0994P+VBXsKz6SM=;
        b=aeg4OLCF8exqQ1yfKxU6IDFBYxl8l7p/On+dkg4GK+gvMs8Mfdz5mDf8KWcTngSZWp
         5c5bKJdRp1vpVqZG7IafE+5zGs9EPb3jduNjeqw9YMmLJ41w5nzFSXwKNA6tGXtCerBs
         IciC2ZNYANjtBTHaO9Zk5c+2nq2dWUXyp6CGJIGAdzpzj0z9x5EyH4tweibovnIdO0VK
         Ow102HktdKRBOtox/byLkODJer38qE7DXeX/5cpaA4Rg9rl3Ek9NjZDaROgYd26/H4aT
         12VNvcdH+fvbBVIUdRpQXA9vk+tLvu4HDPx1NIWGAjWOXruEaG04v4ijh4yEY5h7GDbV
         4MHw==
X-Forwarded-Encrypted: i=1; AKwUvBwm9yHKYlRvXg+CZdSv1gXon9lqZqtMJdgxupNFlGjGu3hoSzR0Wkm1IBItYk+cMcMaW1OewlM6TM1OWy0Y@vger.kernel.org
X-Gm-Message-State: AFuF++nXgrefcnl/1ecx3pRhCAtI5Q4BO/YSpl2PF0iw1dvCi8T+hghn
	n1KxYV1fSiucuTMSdPYfv7dpoAZvFdVYxqIK7eFr0AwxaRGMy+NCV4OOZADGqXUiLnDUEZJzeHJ
	4HPEup6FQF4nyik+2NKNd+OzHu/pDVwNMHJInB6YUvcZkOhhr7oFESHMIadjqqXJzzimT
X-Gm-Gg: AYBFou3UgE5IUBPjpGmdFs6oYZ0W8RSl6OdVPIhgT2KsgyWP0yMk4D/DZ5lAB2OSUz9
	oixrg4JZQlv8790vkZogoC5Qhy6lJDgbOnnjR2YfzSANNBRliE7pYNyQu4qax7vrkBYD8TW7aA2
	YpuZqTFcFFldD8hw8yi+DhjjgsPrsLYionpfk60lTiUKv5wz/e2WtN+4n12ZDHUaNyA5eTkxzAW
	v8qOYYRg82QQAeCVxxQF1DYyQlcFX5lgo5Le4Lov2e7fR6NiUurwEMkNK4q9pHWYlpGlBp6eDti
	Sjko4XycEYLUKiXwdZrOYb0TrZzzF9id+5uZTOIHMsr2j4SN/llzD264n0Z3DfKGcNoGmtbR6x+
	pliDajCZiIZplefFJ0jhtaUVzmCkKaO+mHFTVOi3jY4MFdEwutslQnEw+NQ73ikPB7yRSlwblmp
	t47Ugm8Efk2Vrgzgg=
X-Received: by 2002:a05:620a:a0cb:20b0:93b:fae3:7fdc with SMTP id af79cd13be357-93bfae38002mr16672585a.71.1789827276486;
        Sat, 19 Sep 2026 07:14:36 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cb:20b0:93b:fae3:7fdc with SMTP id af79cd13be357-93bfae38002mr16669585a.71.1789827275781;
        Sat, 19 Sep 2026 07:14:35 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358e31fcsm84307866b.59.2026.09.19.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 07:14:34 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH resend] i2c: qcom-geni: Use device_set_node() helper
Date: Sat, 19 Sep 2026 16:14:34 +0200
Message-ID: <20260919141434.22999-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIwNyBTYWx0ZWRfX1ltvx4NlZE4b
 svod3ul+XaL5VW5WLtpzuWUwPU8ifOXcqIx/IzGhh2iZ6ftAVjA2eGKnhjYylkYScmOXTSPEDds
 J2rDpUz3DdW2G+2s38t+etqwtd7cRvvWOWj+heSc00ElL3D1zjtKLElyyuwsZhunpxS6Q1VQqKh
 Vw6leABLma3XePFpK/1H+QoEMWc2NseUyQ2Dh1ZA0DOeJlOcKG5Xo/5ai9oDhiMua+onVpv4xiO
 P8PuNbQTAWLc8LoreFOBSGwsf1PWPRsMAaG6paJXLQvIEq2A4XJAzWoGVYOl4Uk57deOq616hQe
 0Lbh1F8xrjn3ht8F2IRoqn/CGFGgxfUZvh4EvIRhovPP0ZQiS7J/pu9LBqLS1vbPrzDZc7e+vyw
 xGJWOcRBvFaplhndOb5VK+PFIPbtWpqtDEjIzxKS2wr9uYmmkWkx3rz4dsdg+xyzhUO93ZzqTyf
 B+OxaT7B1y9JOZaVuJQ==
X-Proofpoint-GUID: rPM8IQA2bFYKe7pxUC4Pz5hREWij4ryo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIwNyBTYWx0ZWRfXyD59iH+KPCDc
 h+5HB9HfC9MJmXz2xQoUeTnGrS8reomfhufcVdB2YWmk90dpRUAGkDoBhBYNvLgyF+DgvylqS2j
 YAVlrEosWdk/rC7N6ns42KFyAA0WMaQ=
X-Proofpoint-ORIG-GUID: rPM8IQA2bFYKe7pxUC4Pz5hREWij4ryo
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aae98cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=2VF4tGTWRqxSFCeSHQ8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190207

Use the device_set_node() helper instead of manually setting
adap.dev.of_node, this:

1. Ensures that in if he parent has an of_node adap.dev.fwnode also
gets set to point to the parent of_node, rather then leaving it NULL.

2. Removes the need the specially handle the parent having an ACPI
fwnode, since the generic helpers take care of this too.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 00013b41a6f5..50d3a48a4644 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1145,9 +1145,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
-	if (has_acpi_companion(dev))
-		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
-
 	gi2c->irq = platform_get_irq(pdev, 0);
 	if (gi2c->irq < 0)
 		return gi2c->irq;
@@ -1173,7 +1170,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
 	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	device_set_node(&gi2c->adap.dev, dev_fwnode(dev));
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	pm_runtime_set_suspended(dev);
-- 
2.55.0

