Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94C448B9D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373131; cv=none; b=ITzQ5kRT3ehKlFzGirWIpw6KM3RygPXXYvtpQqdsqcciu+z1V06NVO7uEVrYvRQ5mBQgNHNzvNIKrtz9yTREJHNlyzuyaYwGcMV0PVcDKa2FM/CiUcE7AoVt+QORuySCbxl7bN0fIjN+bzCsZPPEbMP6iMbvwQpeziA+1tMtbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373131; c=relaxed/simple;
	bh=gGD419HTG2YpsaHNWK2vNobX0Re5xBVQ3uFHDD/+SiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sx8UAivSaz6PeJEV7wly63awswrDaosKIAA4FiqcVl7qfGUKQWAR9D/ISgAG628qLSiV7ItwXyC68c6Kb0jPuCB+qndHttn9wt9kThYB4ZlTfsfwRUd4DxA/wzatDLxWIYhe6x4xHShfQ1AeOpTxcRIDB9I0l0isY5dtcUq1pRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBy4QTGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORDRpFGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBy4QTGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORDRpFGE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVLRY2364021
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 11:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMN/dB4ZkEq4ZuEigsZAolrFm+neXQ+47DolAtCQpj4=; b=GBy4QTGYVMDa8gui
	8F6swmaQKc3zd5smFaomemcUJK7oVDYPoI0xn/PEhjz80d+rTjdRTwCrnXOA34Vr
	XlWnZYUm0bziRD+Wowuq7tOfR1RgexndYU7GlFMqNIfrdaL9YxIGchroIx6L9MVQ
	wdeMgqk2OdbjvtN4UIaaJI76tn0RkqHRUs3k/7cKA29KU9Fuxn1LwThrdS9LXIQO
	A4lco8YxJFP7F0NIUrfi8CfKQn/ozYRWXOsFzfG8DpoaVeB/fX5S47pwKwJfx4eQ
	/wH6WV4G2rlNKo67J6pkF7aCI0CWAzuzLsFS+DbF60iARfwyREpvRHscswsba8aE
	ERlNWw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8s5qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 11:38:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so2410607a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373098; x=1791977898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMN/dB4ZkEq4ZuEigsZAolrFm+neXQ+47DolAtCQpj4=;
        b=ORDRpFGEIQHHKFwLIn4u+y37vM9Ckc/ueakDh88Xsay3Kgys906esQwA1xqV8UY20A
         Mfpy01LS5z5GO6fflIVIdfZrLeFRUGVnWwGt3VcB4pMwMk2fG46tX/UgAHaLgVMqral8
         YglDR2XZLZODWXs98NYRP8E4Ej98O7gCH+fnQV1h+dOJJ/rTtgZDRaWDe4BQjFQwyBhJ
         e/Jf8pZQm+7BkqisjO664J/eR3+HrbrrvwTRO0jcrTacvCzmb6SRhnlmZVPx9BtRGgvM
         SmeLHfH/oC3S7O1Dlzg4il7Hziy8fZh9hGsY2RoHLxW/ipeolJXod1Gt4Rcc4FCho4z5
         oYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373098; x=1791977898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMN/dB4ZkEq4ZuEigsZAolrFm+neXQ+47DolAtCQpj4=;
        b=DOU60g77ow+AQJoh3eA93jEPWLO+5wcY5YO+j7p17aeqt9h+zIM0rb97tzl+z82jHE
         0qP+Ac1qMnGMMjsIR7fls6SKODCmJM7pcCmvEkNP6YWK6+qafHgcgzrZxSmw66aTjRML
         nk0M1dFDkHNUadRKgyFPC8ose3O253zDJl7eQzVAbIHhB9XERDywl3oIyH/3Ogc4dF6b
         LNQFiHEEgaFwFSvEXZBgQD4eT4yCzqtquDoeDzZa4iqlrI96iHf0gNPmyVBwWaj2SMuH
         lmwkXfy6ns9O2YApCL56IkpSAT30vd3cI0qEI+qbjychHyuPRIEoXJLcukeK/DZabo4Q
         ouWA==
X-Forwarded-Encrypted: i=1; AKwUvBxpRFHQ1+5WhcfSyugN4ewgkf+EAlzoq1RcYuK+PL1rKXb5wh+3Ve+SeON9nafswLlOMoGUXi6NuK7iLJnF@vger.kernel.org
X-Gm-Message-State: AFq9FYJVqRq6uQ4xf5btk/qknxJ/RmsFoOMvm3eO/hbddLhqIi08AV2G
	LKcuARDNuT5JuZBowpwbZR0cdmNol6dv7ZPHCVLhdN6K80Mvpmnv///QZJIT+dR4mJiTCTH8z8N
	3WurPTS+VirXiDjZjneLzqCR9Rn3W7t2ocwylRhP9xwdt8NUDM3AhvPMyT6s7f6SsjODd
X-Gm-Gg: AYBFou0iS+D1VCX/YuPW6etKG8ZCLJFdjQD4PIaPEzQyGdKk2py6l3RNAJL8dsiNK+8
	KUXpH38zteX9E8Du/McGFJdMCf3iNX1xxzfVSZ586l1Cu/yrG2pwExPK2UJEmLSmDvhjmE7StQP
	6wgjd8hS/oTKulkCTWI5j6aC+RPXnogV8YzYg1jUQUIedHJ5hiNjySSrE4UOTpK5vvKmVA6bRe6
	G4Ja92FkyYlfyr9FtpaWsrKAiaI7b2fcytwbc6wOzHg/+fe3DOe+EvN3oGMR3WlgQA/K/6Dxl9+
	T+VQTTAG6/wB2hQO/y1UpvWOuDUs6ddampAT6UoR2vkujmlhZWGr8cspSZJPIzN8uhJPAI8ZGSB
	Gr6nBNLuOmJsR3RKPQj+nYlEWnX/o0rwT
X-Received: by 2002:a17:90b:4b8d:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a8a1569ab3mr1107958a91.38.1791373097706;
        Wed, 07 Oct 2026 04:38:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8d:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a8a1569ab3mr1107943a91.38.1791373097155;
        Wed, 07 Oct 2026 04:38:17 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:16 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:07:49 +0530
Subject: [PATCH v2 2/4] misc: fastrpc: handle multi-cell reg in context
 bank probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-v2-2-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=1169;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=gGD419HTG2YpsaHNWK2vNobX0Re5xBVQ3uFHDD/+SiU=;
 b=90TJaGDgNrl6dlM0/JPg8Mf4kKYytQP3bL9Qe+l+GIxIRzkUfSCjcUANnGLpy6fm9kNBZCWSb
 3ODYMHKxMpsCFjRZqNkTgp/MnPK8wHPv5693P266MSp6p0LTOzg6WMk
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX+WbM5RJp//MT
 p6VOYJ1lqvi504d+Fe7ABZ4+9zSPrA+FafE71PbtHlEXH+9yZAjlsYybi4i5J9XoYJbmIWC9r1h
 dsz3NYkAFftGbhl9gAd4DFYCiMowBFo=
X-Proofpoint-ORIG-GUID: U6q6pm_wVO9MObHvSwL6VsBwigcyOFEd
X-Proofpoint-GUID: U6q6pm_wVO9MObHvSwL6VsBwigcyOFEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX0dl4sXKf0Llx
 nTvDMi+dKdfCLrS2nib9Fv8kz5s/3KbbLn6kZiDQxFvSgFeWHJxAm2A4ulNtAYCCAcZ0bSbt0c4
 iBl8DS3KXu7brcH3cxe2uvAlp7goWZAmmOBOh6ZStSaBMP9YtkjYlsxXxOi9UBzS1BDgjeedYQe
 28z7eGnbxb7eidHzAAjwtDkzdi+lAbiDK8vmUIN4qwTvDdQiplWhmNz1voKtgXEgSEOEQZzj42E
 qhGnS+W7xj7aemMCbjvoN/Bd5hBDfaoAzgMhcCUx51iu3iu1ADyF5wcI1zXwSTz99dbXMN+4+Dm
 qI34h0YhrmOBFenFWzOMYUTYL8IVWHWYYs6tAhONtJgj1cM6XELnIF+Qdyyr/8e+mZeyT+hFEVy
 Locedm25Smbl34IyAi5nZt2bfrBMUQrhPUQX8MApeN6aSXxh/UujemWvjBdlOM4T9ds+VF4QLeu
 DIRpTrpBQNIZnFthpog==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac62f2a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OuqQISpc-kSra7OiYdkA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

Platforms that use #address-cells = <2> on the fastrpc node encode the
context bank number in cell[1] of the reg property rather than cell[0].
Reading cell[0] on such platforms yields 0 for every context bank,
causing all sessions to share SID 0 and corrupting IOVA address
construction.

Use of_property_read_u32_index() with of_n_addr_cells() - 1 as the
index so the correct cell is read regardless of the parent address cell
width.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b29c1fd00de2..5c7bb56cf46d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2348,7 +2348,8 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	if (of_property_read_u32(dev->of_node, "reg", &sid))
+	if (of_property_read_u32_index(dev->of_node, "reg",
+				       of_n_addr_cells(dev->of_node) - 1, &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
 	spin_lock_irqsave(&cctx->lock, flags);

-- 
2.34.1

