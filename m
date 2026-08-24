Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479EB219E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787535698; cv=none; b=SxH1saI3HVA+Ohv81sSNZU/53hmLJW+Rum6/KVds89vJ4f0Re7mPyo78FEmsTG+mhvi1Gvp3edvwsRt7kEAHQWMaVr4qObqmW0+tKG7QCK2UU41+wqcOFhljAQg+fwcaXcgF0Udrmj7FcJ4LdhajoBokhwOxQLXJgEMsWyZVNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787535698; c=relaxed/simple;
	bh=H10Ip/v2WwNa/9K84HicFmrsRHXPyUP1NserWBBgXQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huo/UW920WHfnSlAGpLvaYsnBeDE7kQ3D4GhYyJC3gx1CLkGc8vK1D1nT3NdEvySf4FMhx9QUnTPF9ulpkVs/2qCEAuJkDXmtev+hf5QrCXM8umiDKHeknQdOVE8vrCuc77jxaHwBPi9cYD7WfTYJ2nzZ88MhzQP8J+TIcqJvxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgUnUNJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNTweE6t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgUnUNJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNTweE6t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0kmX51250753
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5CT1DVv6oJp
	+278cP3iXlXVLmvw18dDcdc8XIOiLBVY=; b=pgUnUNJbh2qVpJYcJiC98YG3iZO
	kJYMSuv+C+SMAHH0QZOjNbUKmKWEkFZk4HBp5Ut48103RdChDjfoK39IkLGykw/i
	fFoT02EMlyzFvD2Gnd99IJWn4y9d1i8zceeRMtVNgq7+xjWVca51fCk2WG2ituXk
	ja7FYJetm84SfymI6XrykvRhq8RM4CBYOQOPxNak9XW6FwSUTr2ozquk86tUYVpX
	0uD+7CtmWHYqlLCS8M4MA2TnDzJnH4bsRjK+L5Y9eDlM7rxG3vXSyR7j/OTroUnH
	jCmcz4lLw0CYtDDld8IMHsE5kWQvVbXCpuBb55vkH9CTkGvj4kJcLQi9YCg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f4wtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:41:29 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so48752347b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 18:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787535689; x=1788140489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CT1DVv6oJp+278cP3iXlXVLmvw18dDcdc8XIOiLBVY=;
        b=kNTweE6tQSk3jc1fXyxWk3QJvTGZ+80Bp6zGils5nK1VrkxwL9vD7h0VgsE2G6/f3A
         v43Vu6dSQ84PkMbqDdTcGvw3uAEQwGcuGFdY/UwN7hzbfHYPuc5zHMZd9/MjJI1Z+SMi
         lrTJ0P4DAHP2oLeUeLdjd3TTzH7xM7iMU2lo+XGeX91oNPh1WdN/c1YB0kxH542Y3SyI
         aRE2Ws7tynvkqR0xKuY92TTYB63HgV3A6MDp4uXT2I/sR6+dGTMMQft9xA5rN/DUDtaF
         NPeztGmnZLdAC850v01KVp8acna/5mvM5mLuhYaO3A4ds93YSHmC+ZIAZl0VCjCJnyMY
         LmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787535689; x=1788140489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CT1DVv6oJp+278cP3iXlXVLmvw18dDcdc8XIOiLBVY=;
        b=RNCTO6IPUJCSDtIVBfYH9CkvSupTLwzkF84yGVSQbCy8YyCFNNC5f2oNLUR2vpaSaT
         rV6nDU9D4hQgQbP3k72FKLQViRLzI0bkWZXELE9l8cm3ikj0dbfE7y/qYpRkY1qBaxBO
         oA+lTXK5OLiMNBFQiRM1p5GdrU+cQ1W5rstHmpkaeCJ9LzoqXG3RuxkrVadCA9RFiLgR
         9x2qOyKDshzoByH5+KMpZrnDVvTiIylIYL6RYD6hNprjxzXEWkMhWI/EKdZ2f4SzZiu3
         Mj8C6Eh+pIumgfU3+c1/GZABlxYznFqoTBx+pMFYdkAW0BkW9rLIorlZr8rDyiZ7X/x/
         6/yg==
X-Forwarded-Encrypted: i=1; AHgh+RpYZ5NJCMXH0oDOecJ7sBrJcvEA/1PRwIPpmjA1NpAjsc/9yfZB2ktzLgP+tNDYPKoBLdDnY3zQLa2UExkc@vger.kernel.org
X-Gm-Message-State: AFuF++nK2R3r/yxurS+9mCwgsit+aDe81sMebuSS5rNs41JPUOL9xho3
	jVWH/z6jJtY1r0juXEMJTGIp6xduDeZ6MPVE4lYfZTsuiAGPAnf6a/y2sOf3W93TWV3Mf1tK/of
	BV2Cs9R5wMW+4/YpllqbUn56s1B9sd5J5v7OBGt2dQa6UccMN0HYns9s/F+agR8mlekJP
X-Gm-Gg: AR+sD12QmaeVqdC/Vx5gjV+tqVJe9s0OHci4EJiiNSotnWU0ejF3KoLRb/HHYDsUfEy
	8mTgsBfVrM/tCJfx1Akkmw/WLzQBmC2kFkqwg9zi1IrDHTKb0W0A9Rk9FtTMp/Ak7tDDcQPVdtl
	KWP8udsM/k9VJEGbVNCIb7g7FSrm/0hwkfEpHiDwUmdi/+CFf9DZh8c4DG3dpty7NT/gwTHO5wK
	/W3yt7k6XPkpQ5B6w28UDQtT6xOHCdq0fpHH9q8l6NqN7H0Ji/C9TLaccxCHpIZ6OR8H6Lx73R9
	txitrEFr5G1uiN60ISibM8Mxm6dXpMTCnEuzBIIaYWsftxDnkp9PUhksK9FuWzffKKmlNfZTUWc
	IGWNqnRaWtWS5PGXgYh38lXWKdmITAIdrFRg2NdshCSWz+m07Dw==
X-Received: by 2002:a05:690c:9c0e:b0:81d:e7d2:a46d with SMTP id 00721157ae682-849eff488a2mr92669447b3.5.1787535689139;
        Sun, 23 Aug 2026 18:41:29 -0700 (PDT)
X-Received: by 2002:a05:690c:9c0e:b0:81d:e7d2:a46d with SMTP id 00721157ae682-849eff488a2mr92669247b3.5.1787535688738;
        Sun, 23 Aug 2026 18:41:28 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:b0fe:707a:f08c:6903])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac00f57dsm25687587b3.40.2026.08.23.18.41.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 18:41:28 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming on Glymur
Date: Sun, 23 Aug 2026 18:41:25 -0700
Message-ID: <20260824014125.2210-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260822142508.25473-1-jason.pettit@oss.qualcomm.com>
References: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com> <20260822142508.25473-1-jason.pettit@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAxMiBTYWx0ZWRfX/TMDMQFMNYI+
 umiOe/9TaFZGFh6Vg1mQPyr39xl29UQ7IfJkrqjnG0ZvEPQF2hCTx4/HdFrEg6z/kocovY+SjGB
 VU9xcvHwx7XnHD4N+wrksRlqg2fWpCqMcAM5zbFuUacvo4x1AgFHVS4waRYq0+vqnL5DPfSFI1o
 MSI05e5Gc0mdgqoTfoBoA22SAlL+jphLhn5pW+hgqVUfbuqVXXFYHj4htJPGdiMg58XohzUg7qh
 lXHOSo586mE5rHULXuzIvzBTytwbD2WVTCTHrvZM80EA7QDCNhBH5KknkHlTpuhGDlvtjRCZe04
 2Fx8mxq1NOdRLvOsLNFcnc4s4DEbnTnzr21F6rpGq1h8pYZ9n0MIVK0k6dgAdfhn9H9MIOy2cA2
 zr6DkWJuwS2S+P2OMqPX9YLvqopH9KB3NyGvyeTigltJHQjBIS0pYUny8JuZLwtOEpp9+Scm6Do
 An+NvirN9yRj4IhXq9w==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8ba149 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=gJSUdyVw_5VDRsqcVNoA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAxMiBTYWx0ZWRfX/Vknqkj80Yfw
 UMKbInuRaE0JehNtbhViCeIBwh7tff9hLlRHF6IPtdehH6l9+A0F9LaSRsPxRUpevGjQjRZjJbn
 ZG8J7TBgDshzQRJvx5SNsfo2sqGRjQI=
X-Proofpoint-GUID: Ie27wClhthJRFLN5doCrRMS-xPgTFpd6
X-Proofpoint-ORIG-GUID: Ie27wClhthJRFLN5doCrRMS-xPgTFpd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240012

Correcting myself. My earlier reply was wrong and I apologise for the noise.

I said the include had "dp" and "qserdes" transposed. It does not. The file

  drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h

exists in v7.2 and the include was correct when this patch was posted on
21 July. I checked only current linux-next and drew the wrong conclusion.

What actually changed is a later cleanup.

  4b04c8779a50 ("phy: qcom-qmp: qserdes-com: drop duplicate v8 DP headers")

authored 22 July, merged 7 August. It removed that header as a duplicate of
phy-qcom-qmp-qserdes-dp-com-v8.h, reverting d10736db98d2. So the build break
on current linux-next is a rebase consequence, not an error in the patch.

The practical fix is unchanged. On a tree that has 4b04c8779a50, the include
needs to become

  #include "phy-qcom-qmp-qserdes-dp-com-v8.h"

which still supplies DP_QSERDES_V8_COM_C_READY_STATUS and
DP_QSERDES_V8_COM_CMN_STATUS.

The other point in my earlier reply stands. eca0e717aab1 ("phy: qualcomm:
qmp-combo: Add support for Hawi SoC") added lines to the same include block
on 3 August, so "git am -3" is needed to apply this cleanly.

Sorry again for the misdiagnosis.

Thanks,
Jason
