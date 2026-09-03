Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8953C3F4A
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461693; cv=none; b=OsSlBMkNgIqkPq7u+ycDfZh/HF1+qFraBd+3yFn+sqjhxro0zZb7u86C4kOUYIlIEm9cGpUQQFPbsGhZaSN0veNepGEHH3daqLfQvGaoHaU+WxXgE7e9vErJ79QE86f9HheB9xwX7pmOOAvp34d57B3V9u+TLrwHcXUTUEYE4Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461693; c=relaxed/simple;
	bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DebgRv+ynT/GACNTnIrOexb2EFoesVTUphdd+iIE9F9K82t+JJXW0c1jAbm1YFVmSAxGVzGP/13lTSgbCL5TKfWtu2wRMOifQXzpKX/nkIDWvFGHVODgX+CUHNmacLSSw0LrNoKnGFd+OUJW4jl7Kaqk1qqtK8NXzAfk6tt4FA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDxQXeGl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob7Ifg0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDxQXeGl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob7Ifg0m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3VdD1430687
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=; b=LDxQXeGlbB+zParA
	4JxeTWgUg4obq59z2T9jEIaY3sJqLOVnjcOZ5op30LxQgwucPzpW7H6GqETZJ4Nq
	V/RMxDDvTzTuINKMeFSWBzRs8fQUDiJUxt/T9310441FBwZfVZCoe5joc70zRfbW
	7OAVPgp6wGQDLsygXQpX1eDQwHazn3JiK8MPOllZhyt8PkFoAD35JF3cDm7/zqlP
	FGQpNXbFxOVzz0xoG6uYMKBBSNEGZuH+2BN4CBSjbCIKzp4fa+lmQBLS3hOEyseR
	qiM65+SBwSRYgUBgBNrFseN2Sa0sFg+IWnjSf22omtTmaBIG+wfOIfyVKs3uDPQ6
	yplvAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4kkk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 18:54:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso140863a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461683; x=1789066483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=Ob7Ifg0m5OCuZgMuEyx8JT7urnNM33jwjDd6DeVn53pIobfw2jU2sZbhd78n8BUp1T
         adz7VgVLpcBVIl5dOzKtCqm4bhPjdlZSLNf3hNh79pcft7so426N0jb4weeQDYB/wpe7
         U7MmL+PY1hEK+0Cf334q21vjRNGfqR2ZpQ8xcylqH9hCFG27n9xb73tb0CN6jSCpvD2i
         PHWKkhnpx0cwAUYOFhXHuHgl7gDARePSHX9kc4MP5kWs/oJ5ixvWQlk8HNW5vQAMNFK1
         +gbEjUJ4eeHomjzs0tU/Q03NJU8+VaPmt8MqdiT0qdNKaLajAziTJuordS+C2NaAdw/W
         MbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461683; x=1789066483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=P2U9ZqNWFMTq0cbe4/fx3Ib0KdYUFvhaJqVADyCFFsXLQAN+sgUuN1QhtKX46OClC8
         cWaIpBzDd3lhJYWelwfgH2dvcfDT3YlnxCix17+3laudusq8AcCBp2OwYC50EOT3Hf60
         t2Y+iT16Rm+qVeRsl+cqhCFO7hm6Vk5Pbu4t7+esYUMrGP0buO4gmW0NQ7oVyp3ChyXd
         WEpr1wYe1bo29JTxnnJgno5HVTGD2GfbCYCtQO32NM5+JmdsaWPK0KZiyGzthbR6jWzm
         nLzUlkJwQBLi7nTMuzCXVPU2vv1ZqJ0MaL51JETFEqBOnjqRG1sGMY4gI0R9mlxJh/Q0
         AzIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqZ7t4SWkTCAc4YZ/MI/xTE53Esz2vrPIzFm+kBrwy8ECIBFFkLTHKeYPnQij84mHXMs6mjXHrEojTWzJD@vger.kernel.org
X-Gm-Message-State: AFuF++n37tH6uYEByJ+W3+S7QmYtkyY+Hwr9dLHA/9kEQWc4fP9ufuy/
	GyY5xlYXzGETO9UhS6Q5t3x+IwyKy3lMlx9TDLipp64v//jXNyVdO2aUiKxxphLfN/yYZuvJCQ7
	zSds48Ya6Y4BcUJF1DjHWLwi3vYbxkBB5ntFzIPA0FRRCFknnsidfU6Juzke3lebjKKeA
X-Gm-Gg: AYBFou1YwMf/7BxPYr1gAWjY+UQfmfJOiMKpqlFp4pOp5hRnXFbjUwBgBXNX/NIFSq2
	rU8X3yijea2/mv1vIX1UDbRmaX3hWrLNLOJZlm2UuV2loacwwTUAELc22GeidStH4wjALnYDZ/X
	k2/U7/kG5Q/02VKA1wp/8B7aAoQjCg9/QeGtefJ29ZrkpQtnBlHhKniKZ/mH9VHANp5YmZuNQoA
	NFDMWyCDHyc1Egqh+lOCjUw2HGDGUF0+SIyHSFpkxmOmTQsQoWqamLLd096vCv8xDHU+jNQex3h
	Zc+N6GazuD0E5+WAHp41fB+fkJR0s9iovf8ZIg8d9ki5jxGzQ3HYswcijhTmJfbH+TuNHQwm5uo
	azraE1Ro9MuS3T+an6gjwS13sKYBKhQ==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723117a91.25.1788461683357;
        Thu, 03 Sep 2026 11:54:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723030a91.25.1788461682819;
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:48 +0530
Subject: [PATCH net-next 6/9] net: stmmac: qcom-ethqos: warn about legacy
 RGMII PHY modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1105;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
 b=VDlMBVbP9rRPq/DX36zllF3huKy8nLST52QEJlSSp+jxj3Zs1EezJmpRt51v27kOytNJ7XBqv
 7jGNDwMby5uAoWl595g90dVdQe+h9jNOgpVxmQVVPMCnxoHZ/z8q+ZM
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99c274 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IeZn-EEC65Et7LrU5-sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: cI4UC3s2lNlL7aKYXNOhiRQQDcxKa8qf
X-Proofpoint-ORIG-GUID: cI4UC3s2lNlL7aKYXNOhiRQQDcxKa8qf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX4yAv4emv3ZUI
 mQLifMOnmZrqmuTJVKjIi6EftFPePo2lmhF59hM/vWISUucupTIk+TXwSBHjpsZLXjNhTCXzSEZ
 g3iB0pO4yz+XL0LjlI1GwRMAGiSfYDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX9KRTVs9LxG3C
 ZGHd1XkDvUS1VOnwcKquNpXnqz9UEfyYxGdLzMF64pbtZkcKI/j/Bc+tTVRhPFvjsQbVIzC/dEJ
 3g7Hox3N73/JJn7CI+hgmtE/wREquev7HHYobCF4EPUiQ9x5gP2b5V04oRQ9LQrCk8kPRhIqftM
 xX+lpkKdgTfzbbR3FJMfeY7/2S8d0Z3+2oQ7CXUJqiiHRUzzqulu49Q4GhSpXfwT13t3m0srgNY
 7zbXi/B9eipIqol0rnt0bAdEPRyCvireRzjYkKWkh+M79gtzQHOhmQikNBuLoFns6O6enQgnhgc
 rXy10iNwR7MVLxzkAg7UfPCR689KRkaXQ2YUihXRY/1Q3D2Zsdm9kJdwY8XPmqepXKIcr4hoZur
 QxJT3lftJHqAshvVSLW01NlT6XJ4qai0xavJKH/G1AOkIFXuOhrUBz4r8XcwOMxpD3y+jAtKS1g
 BfP5r6iUxWJfr+O1Qjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 67738c1598c50ade22f2d548a6d66911c348af51..2ca2f03de30174c9771fdc517c0e21e3b392ad76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -554,6 +554,8 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 		return;
 	}
 
+	dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1

