Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596054;
	b=Ax9LR7dj6UKhCByt8VpF1qqnoYOOokUmRk0B0b6MdfB6tXMM7CPvTuxgVtOSBef9m5aN
	 NFBKuezPwM6s1MMDgUEF7I0cw7TJlxiXCjEhYaN1j7bSuz326maGH/ZbmFssb+I9zuop+
	 6JAa89ORMa+v6ye71fHu7nvYtTHPNYJIv75VS8cwmPjNptXBgykcNYnutwHKD5pBQTH9C
	 8fGA2Nf+cwNNnqBksUPwtgx6AK/MC8mkZdWl9qlNx1XnRC4ShsoBi/FH1dhmvlo2Pm1Rk
	 EYD4TyGzdZkeciU2gneDRu/cUEaey7b2pls1bB+IunF6hmPHuccYMo5SmDZcdLirang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=lTKYNI0f17tFuhUgkNgWvdYgEysCuTt7h5bBmG3Owq2MAALHJXnNicSnPbQOuGTgCHVh
	 EiMxgNsM/4/Cb9lr+FabH9Td8V8H/oiY6XqFneDvspAnOoUw+7bMIfvjzFc1TfSQVi6ai
	 eHbYyiKhfSLcZ4PrWY2omRTqBVUMEyScXsN0HU64FfMl2D0eQbj9BBrA9etrfb6Z6pti/
	 wzio43dPVR3K6CcdAar4pDNtkqQqHVTp70s1ggcrcJzqwkQl6NdZiw1Gb0rjvW30OPIeD
	 uB5SPp3w4WEEBr1FDuRsObbyaM9NhzY1MmDOVe4VILWJglGSZ35uSuK3RkjrAoQwsDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Kb61/I7V";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8705660A261B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8705660A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kb61/I7V
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFjNAn782308
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=cQLzIrhSoij3Q3A92ujCBOk6ye4
	qmX/+gDp3wbXyaXnThiusMCKD3rVDNtY+4fr8xgyTpKSDW80LvkXAURGHSV25zed
	40dcT1HGZG+naWL+HVAdRSr3QovZKOb+WzNFyd2IfkBdjqdlD1S2oUQpM2GFU6tf
	jOwA4cYLo6OHq0gKz31H3gF5giQ7IhWrVmt2+S7bYLniTn4JqG9BqLikIlUn+RTo
	r8B9Rv85nFDqt9h7zPqSc9FpscA9TNPYOv6GFVawa5StM/DnjRgjX1GykyPffIG/
	fh/LWgFda52/cqPgn++nPXffKiObpwfDeLL+OI8dz51iCIz3A1OFQlHn4hA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jvfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so769907eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596051; x=1795200851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=Kb61/I7VQ9J7dCBTg3v5WNKwtwyGwC5r3HX3TJeuyRU6NpEnJ3vnN07F2oEv+KZ2+b
         CG2ssMYR/fRcR6v90025Rc5Jic+fVRM11Bxc/wQIF6BwQD3UjuHeLat/8MbDxqIF+t6Y
         YAXHkVOKThK9vm0kqIpMM0wPS5Vq8xyL7Mm1RBoBlpGNazElH7AWRcd3aB2xOSoKr2+v
         EQnIEqAN+x5U/Rt1UKTdZb2N2AvErQ/r7pWyRwvwFs7vXiQ2ZYrfxRmgq9lV9FIO2ERP
         b3r9I5kKyXSc5eFoYs2430OtC2rqb4wEP4mgeOS6U3dDRKKhmdRPcdNQX1ajQO5cfK91
         TLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596051; x=1795200851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=iN2rqVtC5shTEwc6EGSgGR87mLQpRV9f+SeDwl9wYWrwpE8kCyBLYwpC27Xi79YXNl
         L1V2369r3+Ank186pwRdHTgQTxYxW75CKfcZPxDVwDfZgjkbzggojAokpcGnym/NQEUC
         UEh4QkURZAwn7h7yaNKBU+bgA/DdhYTgmZm/f6y7NWaIZpZ/usR7Me5EdBrGEmB2jPcE
         K2S3QD3wi9hcVC2+qorKXte499YX5Duxj/8wOLwjOVM3Z/xURbwfKLAxR+vhguMztoC3
         No0L1vnAj8WTduEThA4WAVApMLCQMQZ/GfuyPC60PfUCiT+5ayvztQnln3lwgXcpZGq7
         oQGQ==
X-Forwarded-Encrypted: i=1; AL+hErEgx2e7MjPXLzy8WvC289IpWDNjfoUuenp4W6LUp1oCljVCMxRj6zMfBrtZdQInmxW2bjvQTM1bMrKy60wj@vger.kernel.org
X-Gm-Message-State: APuU4Z+OfJV7CFgC05jTJ2+Jgt6c9oeEDsoNlRavdFW5kVpRrwag5FRs
	gO0MOILewtcQ+ptqvozuwCLAA4OWQn8abZBtTyvodfn6oZeqz8k7nokIgr17HjKq5KggoAzRsPK
	gcdZnC9dHjrjyvOM4SCDS4DfQRUr1ab0wL48LgWSR/nD3+HMBh6Rk4ktHa9RTZrZd9OJm
X-Gm-Gg: AYBFou0MN73CU3k5RlNZAJkj+Yq/BsbwCD3OREjf+KzvpXN/p+Whvpw0fIa/4dpBSIR
	A6D8EmmqQLebY9QtAjRLfu8bSSImiTgNlMUF6RH0SHis47KYxvJYmVfp4V4F5YUkKmOss/dTvwk
	mWAA2mCSyjlvyM/fpLZXgpJI8s7SaUDaa4OJ/pyP6roAOdS2OeZ3WabCB98NIrcPLSVM1Icm3FU
	Khb7luSyRR324NCETy05Hnb6mezlh/Erkb5ibnPum9XPU0zKBzox8GBdYccbzmILwQIwI03k3IV
	NycX3dxfc2/m3A/qTtxRHUvjqTamhZJYklpUVJfkfzF+CmR+6xZTOolipUb1bWdczWQqM3VWH8k
	4DONcJm34huXSWhb4TpHkqCL7Sk68dc6r/QFBQ4wSFgR8bSswTixqL7SxTeguyXIvF29MDJs1iI
	4=
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885927eec.13.1794596051387;
        Fri, 13 Nov 2026 10:54:11 -0800 (PST)
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885896eec.13.1794596050515;
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v2 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:06 +0530
Message-ID: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/LSQQZ9A/pzb
 ZovbFClHe79Zcyerjgb/MzoWXajy1/wPNi1hk4Ufk+U5hxATK8AzznUokASuXGUsPb8O59ScgwA
 UFJVC2j8cU+yykGY8w6Eu0AfOvO4hBA=
X-Proofpoint-ORIG-GUID: xo2gF-52NU2XWH3awCWprUIVf2iKm25e
X-Proofpoint-GUID: xo2gF-52NU2XWH3awCWprUIVf2iKm25e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX5oDkBi4xwaCE
 46KOta5smjtDiWyc4s4dUSp3vLlomb1VsOfhzE5p/nQAb45V2xHK7H+rCGwnnUZILQW8FgsgXEX
 OjxSwq2/6Ck4S5Z+iGbZVGeDn9Nm21sH5kSNNC3/Pz0kpbPLFpz/yv4cSYuRwISFeyergvcjvmQ
 uc+gynyUrf0j7PnsJ/e8Tf5GWxwtSlK/WWwYyEJebssl4sciYpFVbLXrotG0GfV1w+2CKuHlSp2
 Dp1lYiG7UlCQVjUkB+0uYDmv3MdwTbtbe39QLCHT01Bbgkav2XNHWDWxl8YvBDH75/0ZVGUUbL4
 ZExUbmpFxhY3m+wnGjem3182LsQjTdoYqbPsH0G+i+RkFm/YMTGzUDstMQzzWhPpCNhjxTISUaC
 gTvvaNEi1qVJGPA15pvoG9vVGjCYbWk3uLqyrDEfzssiM90/fogMDyMUFlnPIdURAErDggZQzz2
 aYRpSAaquaVUjRnIaHQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75cd4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

