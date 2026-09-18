Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755864F0553
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739411; cv=none; b=pdGAaYowAzHPW6/yiAh1SBYJMNb9RcHGb2jkpt5/u/0AvlUq56/GYIVIxDOtb7VT5lZ/741+doS1ePDNtx/wHBzkX57iyowhx1/8H6/AG7IZHDvwaJc95j0yQt2s+prsb908lscfjKf7DbMAvCRLz/mOY3nit0RKYJjMPmKAtCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739411; c=relaxed/simple;
	bh=3zPDkuCDmQ38oUL9/eF9wJT7+qJydWJzTsR5SSVPT00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxPT6kJ1tOPYY6U2aSTT2Cj3f1BJ8oC2E8qwrE6RSQ/yeJy8dtOrjkCsoyi5PvuZ9zr3yhPw4CJvPqTp5uCjkaLjjv1KshUk3ikkxuIovcCDYWHMskyunf5XvBIxU97qX64L+ZRT8JwIrkvUkldlwDoP1r0YP+I/lokwJC0Vs4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgDK1/CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4NkAV8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgDK1/CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4NkAV8k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOnT51354153
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=; b=QgDK1/CHfX1G/gL4
	S2I6jAuWNMUTvi3gKzzUZBr2Cy4aLUUx8s1bpU537HyOiPV0E617cKVhDtOwTTNA
	ZogziqhCjhuF8+puWTskpneB+fTnPgcGCzQyN69JIWnto/HYxEjKX+2Jzgh6EEI3
	T1Phzl2wsx82cwa2mTehDk0ju1gnoP1s87f74Y0T1Y7kkmTBplDB81SczXkdot17
	H3wky8I2Bo8p95CDN4KgtiB+X9w/JmDAbtvNHnueU/dwD0M18TzXOmhSr8D9ZI3x
	kPdxZZ7+MT4lnP1z+qe+UOA9nj9+WUf8D/c7i/oMWzanNArFPsvzJSDbonwr75TI
	nyuccQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv909b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:50:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso724585a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739407; x=1790344207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=b4NkAV8kis2ZYikazsxk3lIx6pMovHhGGjeJ0kVddugQjK845Cm20MIdjsm0oOMRKv
         ZaLVwTkcaJ3ZzsSojCfSa4vQXU9d86yg0F3iAl00tDTNZ/ROxpLCo5fDchjjAwvLrePz
         wjNwQoFKMIEKbY/MpWl53KvVQKdCnIlEzXPhLp8qcX1JGyE16TAwvex4nVFFCWYFG36h
         pM2hunhx/il9wZuzTU4U0TB0qkMW/6eIRqBuaaMQSgpgipC3KMwxQy7WKvX6lK7Apt5T
         aQbtnc8IbeCGSzQQP6g5/FXSFBnrjcTDdS5faAkj1pCP3Vlh3kossvg2OLhd0FS3iMGd
         4Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739407; x=1790344207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=o1jmhNa7O4sHbI4GHl7f5mSs8vrZ+l0+WkCVu2gEdj33/96ZMxItvj8NOfcp0CFTFF
         s3l/A4DgctKCNfX8RqFLp6pz+Qq8WR2+juBtboBv5FOY5qqrGqsJF5jO2DXM0EMhS6xM
         Gn6bBRAyzzkI0AZiPWjqFC0IZUxXLVKcQOPt6DnUF6QjLsFfUtk63GepfcoX9kYGOXOK
         r/ya6ZIv7352dgGk7XoedESaOjsHaNf54iykX187aWcmmtt/HkoLVmbGw0SxetxkHfWZ
         CqSf+u9RyFohl+o9BNBM6V3ksjqD0/Xfs/gQJw1XHOmQveOUs/dcVFkMsu+PF5sxKupT
         v1VA==
X-Forwarded-Encrypted: i=1; AKwUvBy6Y6TtvSrjbS4MPStATn3d7HHeM9NzcNDyanVkvCiHSCusi1idKnkaRL0UqUgA+bClo53CnNURLh+RiLoC@vger.kernel.org
X-Gm-Message-State: AFuF++l1q8E0yhhqoO7zCjwLoK9+Ty3lfSMnxJKUOCQenvpSRB+ORy/A
	W2GtpUdxQ8oOfxCDJMga0rh6T7jaWUV/fq/68rr+pfy2BK6I3bHSWmdMY5IugAVsZVQa8q+m/lW
	7CQiJfu8ASVApzUSzBRBqJ4UjezNMBLFVHV2pLE+DvEm5SWahCfzVxo2dEpMEC3/vDdeA
X-Gm-Gg: AYBFou2xet92vuLu87+o9qHboTIs2dSocXRaTldJpTfFYrsd31/ddel2RpPSEsAfgV/
	y8WKJce7rBxppW8z2APpTq3WMZlVEW6+QiCqrsnx+UaZ4eEB0nPwH/RKuwTyNLvpzeEbpKwgT/h
	aWZb5+yJsTd/1SAWqYKIcsW8XUTnD7MojNk30pOnfC5faXs0MxF29hIZMFtKOV7JHA2JDTKUWq4
	sE8twwUa241BseHniXbAkCJGhU2N9/w4JFsMpjaVZV0haKpceYr/Pqcq2DNz0lB5Fa7yOejwQim
	YkHar7rg9iZ8KsvyG/birkY6j8udd4W5IWlX6Ou7a+/utkagoSmYXfBP0/P8YWHR61Izjx0kLPv
	pPCGMnr6xzJ/c2vHCHsN6yn/Yuks=
X-Received: by 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr6221627637.4.1789739406878;
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr6221581637.4.1789739406436;
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:19:35 +0530
Subject: [PATCH v3 1/3] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-vmid-v3-v3-1-f1cbf47bf173@oss.qualcomm.com>
References: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
In-Reply-To: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohit Sharma <mohit.sharma@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX4jAzGjO8mGgH
 gmdSQHg5GnfJDu7DASIGl6OLn4cRapLDOc8QLCj/a+mvzV+6ydrVSein8H2DAfZyYtPWI4mW0wO
 +YVAyKjrvVfaN6HIzcCESEHoLEC3HBM=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad4190 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfXx/7j4utRgkoS
 176uPAU95IVLuFBezRvgECEOhTRlwLhnh9nL29TldnP89dgB86Y3qHwYNA1jZxBlAbCOMNjFJGb
 vdBsJg0gDuvgBNau67KQ5h0A1IiC6GYU9RTI631FJLJMiiCOR62lnwNfXcIcQ9e7M7O8b4fFM0S
 XRykCIr8vapHdPpNlY7Ysi7B6sOsD1wMLACjHuaonFlcdrE2cEemVpCc8mF7JCLR4mKrsvg2zPi
 nVjT39tYga/XuGncEvH70YLjSJQokTHz6450D6C1+j1jkQjh0VufoInok2PXMJMt+52gaGuUo48
 aGQ8TsPXJUMX/+AotLvOD9FRgV3dbCd7V4lphxrtyhjtusOUa7nrGcn0FcG8BNcEAxAKzV35vcX
 w5B7BGw2qb5UwhPRoNdO/ciu+Shakp/zrOJ/GYi/He5t17FeEUA1GLXfAooiIjN/+nIOKqagOe6
 Psyb3pDjddL/I8Bclrw==
X-Proofpoint-ORIG-GUID: JFU74plRxO7NbAotytSBNmCH43fijSyR
X-Proofpoint-GUID: JFU74plRxO7NbAotytSBNmCH43fijSyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180196

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..12c6dfe4c58e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -894,6 +894,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

