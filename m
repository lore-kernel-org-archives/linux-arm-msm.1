Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709493D5222
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539559; cv=none; b=F3+q7w5F0KKYLIzYlmdrVRMC5k9dHg+UqMlz+XY/vpedhIa0nOxuUoN9sGVX06vsFSWRgRWx1WUz8muDGO/N/5Df9zGuJ+QPob1psWCihN99LQTskh5P8jT0TnaSmvgoLIGx4N+U4ofsxHRpf6W2veQ32ygG3kkgnHxcqbx5WJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539559; c=relaxed/simple;
	bh=xqsPX1hXJ5p8S4DkE8vtCmD8bNryEUzUedAtz3x4vb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nslmq1JKp1cXiFvszy3x1xQVLyZQ9qxOp99u40JKK14ORk0ufjJSkm6vL5gSTeHjk57yBiSi+Ryv/o//AZtt2QtR60hfe0vg4cy4RWfAdkYG93W7xMTNmqbk86ZxXKK3ttD0E09D0Peavgl+9yM4YnhAcFsi6HNO1/P0eK7cxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlqIfYj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXQEfAZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlqIfYj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXQEfAZw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YFPT2043824
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=; b=KlqIfYj24yaFf79w
	7Rebwfq6wOB8LJIJfcOSwVzj8iaykOD+BlPcDZSb0cBdWQ/OJ8g/3RUKCH8I84dF
	bTklcwnNbIC8LgFDvh2Zd41sQa4Z4qY1zfhH5zztNgAHUzbG2j33ECwyTCj4sYeg
	2LdXdFfBk8SiLKdVSnwAmEnDPSHtSk4ZVYbojPcQcNWXIcZypczqSyWi9G+LaMkX
	aZkg1tjB1QO21JwFUq0BmbAHIvd8q/a4xCzpwESVMJTdxYAw7vYZo0Rqn+oMRnt6
	2a0leS5KgupFo3792wHUl9yNhKjib47ri1ajCPMMrb4qrUNfn4M+W+Y9eJkYXbyl
	lfcfHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcggv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:25:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so109977341cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539550; x=1785144350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=;
        b=DXQEfAZwkSDq7MZGEs8Z8f3QPtRakOMI4V3GbuVy46TlDCQKvuFISSswa28FX17+14
         0sTKpBvmEP+InRsWsJWvd2rf/XbTYxz4q8/a3DEc9tLVT/NwHlnfUwUmgdR+L6qaqChJ
         36TVy1Xfw0weG63jQP7Y+TZ9E0oPT/Q9O1vACeNsQdssN9pPuNeNJylJw6FqRxX8y4vW
         jGvpWC6gKcQX5CZmj6OIQUVJXPPNIl40rpqKX+yYXIN1OcFEHNeHp2Hk6WXT4Vg7Huc3
         g8gfBER5/DsnrU8RPSIVjWQNinnZxzI3wlS9dPav0nmfafil4yrr/VPxCT21ravo5kQA
         DMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539550; x=1785144350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C15lnSQu9nB/PyhjrNzGtTe7xWsSDZpgOoprGffw2I=;
        b=tOufzY44dSR4fJEaAfMVhyoCFNSuuOSZkWyZCTGLHxrTzQYza57UQIZdWax+t3YyRo
         7L13RFzLdTZr8OaqV66gw2Do1cjFYM1ADmSNs9KDHyPIK/0Z9vDcgz5QyJ7D2GRtWz+P
         KeTYn5GH7LmvZpdLv1z1N1IsPBqvhRtNhhbuZ/u7l9IGrFzkxtfWemQZ+xPyxFAS3HS9
         SvtBMMXJeQfgE+LSEGJmsItnPPNGa2KxleYltNj5t9gZKSZFql1WTGDe3YX8lqnmDfGB
         dDqJY+DRkx8H0BrGmKFDRjupSNAtKMQU6ERs4vyXKru+CTTMJQ/0dnkvNwXxRO7UA7tW
         3hOg==
X-Forwarded-Encrypted: i=1; AHgh+RoFEccZphqfknq1e/DOZFHV6dekLohGg/MY9m1po8OaDGtJViqfKsI/nDMK/TppDWpvLFBzIJAkAIDC1JYu@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlrqVSugefZvWRMsoMZF6iaeAUKmnrMhh/G+MXadYUu+nLpSo
	m16GpeeJiCCLm1MRTHjSE/oG2Fn5m2KLv6YnAXwlvvn3eOb47P8a7pWv/eI/lzWYs3z5+o5kdfV
	czM4iLPYds4yMa1+43zUCU4y4DXFHqWGA5KY3Geqgm9Jwbdnb7yyvok/4sTSNNCP0wtcE
X-Gm-Gg: AfdE7cmDe77o9VpzMSyW5hHZvWs4gjxno6Tgrq7yGWCoyvV+ae0DX5yfwKOaG0eawM0
	FrMs7SseUPnBFDHmvRFL90dOEfg6gt6CG7p9zE1VQi6GrPSd2R+gqtO3EoCazSSnx6G6mHLg2/E
	izrWosxysOBMb0LA2Q6qq/36pX2lr6R0UCteQQyPQYQy1U2wmHRyGGXGpgAYkpbsB8xtSlPK90L
	+UfuD3RMWI2sQWYWr2wizOdQnNfKk7IkaMhXk4ywWRRoKmVzAgSt0LyQOJfWmhYOqvPRcAPNY4s
	k+bTmfsbWyxIJzSo5e7rqfvrErcC/xcEdmf9sOA/U7DWnlfjoRADI+0PcHDgakpHE8vRIA8rEX8
	a6e5+2++9p2BwKfPkL6lR1aC0Nve4/g==
X-Received: by 2002:ac8:7fd5:0:b0:51c:22c5:daf8 with SMTP id d75a77b69052e-5213e886569mr118276751cf.59.1784539549625;
        Mon, 20 Jul 2026 02:25:49 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:51c:22c5:daf8 with SMTP id d75a77b69052e-5213e886569mr118276431cf.59.1784539549156;
        Mon, 20 Jul 2026 02:25:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:54 +0200
Subject: [PATCH 7/8] net: mv643xx: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-7-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xqsPX1hXJ5p8S4DkE8vtCmD8bNryEUzUedAtz3x4vb8=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpd6X+h/ifYFhQyBjNRAMZp3sKfs2dOQQAGWOSJWeEWTFT5/
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqXel/AAoJEAWdLsv/NoTDaPwP/RCK
 7Pwxf8vZOh5uaFiaUylNW9sFBv0DTkc12XbVDBYvSH/UfZrhZNMpdObQiVZ0SMsBjpcFYp/1AZB
 bv/F5eIASG2zBoN057E5VLLCsx82l6r/JbeVQgw5sCPYBDfaFMn5uPaQXGHdfCtVzj107jr0atg
 MpQOTuIilyBFr3uTKuOU7pU31UrvyYd/WaJ9iIF6yscrWH/v4Qs1NgyuD5SXNzXQy3CdXMuZWPw
 OfBtGBf6WPhpJYK8SJ8cxHXNTC3mp02VZHt8QJoXG+UcIywc7z9x2aIXBI2wqX000BykBPNlSWC
 mY3n3CcQ2YJPZstI6l/D5a5Ag1tvZyjFn23kZX27b2b+0vfEWAo3XxJs4LD96b8ru1CihZM4DNr
 J7ePsCpJxshz8tCUh/g8vlubXLhRCQuMOCve6JfkiVWeFuCbbrtw/uB+qI4BX6ItSyElc3Pkd9A
 zqucZ40Ol3KJyC0Hpqxv0yAHDnt73BHlxnotHkeJUkco+UU572qEZp2P/tHBng23kf7VdgJKzfM
 0Vmj+kL6FAYBqwOZUqDULhVWTcaepaa6iM5W9ZkRvjLWWBLCdYGzVZKBmU+3X/B1u1vnRuKOPdc
 vNkkEAD4/hll03aBOJFx5J4KIfwjuuLHfYesAeoCPVMULek6L0iDo1ICKKxFU2N/ZGUpG50fB24
 46Qsg
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Oa4SJDgQ1NBtGleJ8UB8nz3kC_0ffvRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX2h7HQXxfT0dy
 2Wyypy8u9EOA7gaTT/aPu+4B5Or1woiO6XorT8/aTZAJoQFgpLpj5OwgY0t4T8CwvO0wFyKL9X8
 +Gs3iaCS961DY5cft4cov0c830nPFKuqJxp6KmeFXOrqK3Df2fdfD7t5Y81Ptul/nuc9QapKz2A
 7G6H9RFKjr3aH833ZUhG/gu2NvrcSX15OFTn5QFbnZt49t2YYKVUGve8xGhxUJBaP0X28VmCpMh
 W0ILArGgwaj/NtfC4Y9dl6bshxOxAAw7V7D5vPEi3e6vxmbb40aTsWEcuja1ejigqN9/t78hE7N
 6fiWx1sZBJ8FynV6DXkG325ArF3pFWEErvkrIeMoRj8zUfNFEiCmVw/V7IDHgHxy1EuAOb6FTUg
 E5GFyPuhvHF4pkPA4T9e2qxt2j1HSn1KX37J1PNlI/U9TipNzXeK2cYs3YbXCnOOfBPW5QmLzXE
 dyCuSABTbNKsMfUsdIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXx/XJnQqGJk/t
 CLDmoZiezd+0qqqxTadLkLF02EdcCIsjk+La0wrIWwFcwODUPzxaxRynEfM0pqQU1xxZCR5zx/K
 QUWQj57lttQ9HXJTGDGwGMVG2WmRnsY=
X-Proofpoint-GUID: Oa4SJDgQ1NBtGleJ8UB8nz3kC_0ffvRn
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de99e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ue-CkOehRSWfgkZZKZIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 9caa1e47c174c9d7a161b7f2e2ee12a829b813d4..2f2d6cce8d852b9ec3ab42678a04a7915d1f00cc 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	platform_device_set_of_node(ppdev, pnp);
+	platform_device_set_fwnode(ppdev, of_fwnode_handle(pnp));
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

