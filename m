Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2C3FCB2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239739; cv=none; b=lRJpeRV0Lvkx1ghsIC9A0KvGKN/X7NvM5g0wKEqxaTSRjMBOYHzS8gV0nyLWSqd1eIzwilnQuQ8shmeR/yAbARK37jMvuqF1xvBrUyhXxG5xMgdsE1LJ21T0Gbwu+p/3cLit32uqlHmvXDDzskWS7GJrvv4fm6VVX7FzVywglns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239739; c=relaxed/simple;
	bh=NvJv/wGcdyRcEimQiSEG7z3G1zeG9RZNEXh1D8pxla4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iY0Lt5U8AgNQ5xLRfRI8UG/ZIJpIHMJJvt4oJsqI8ZXxrZaUauzBI8FphwQ4WyFEFO9rWUn1g9N7MVmzAW1jM3bokGk33s3ZS6FJYMnXjwSi6ivvNiFjTzW61e2Lb2VqufQ2lnXpxmzaJR5NEgS7cBZc22IqrLOxzzk71j+aLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPAc/YAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNRr0LkR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPAc/YAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNRr0LkR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHxtw2606275
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DOU1u1YKtdyAp/LhMxU4Kqj9
	bya+6a0KlguSVpNf2bw=; b=hPAc/YAE0gCGnRYTh4hat4vE5guCIemtdbcyHajc
	JtKx4zBn2pANLj/DAIyYGMAAwvdrn4CnQHdZkm13QKkFdpdmolTrQ7DqFig1ZJWo
	qaAmUUOuvdl/Pag3kLEHNFTb4PPLtnl+3kioisMmcElwdG9X8KoOnnJ7RwpIJLiF
	o0k5GUGFbH1/3sG4950K6ddemcpzAk/J2Jja6x9pDq8AuIpyrWJ8J3tbEfZ3DhcM
	FiA3vZUz5Ukau0POSzM6FCJRii/5UssCpyBDI5ih9AfbrRE00vAifpD/w78DGcoZ
	Q8Su1ZpwKsQSjJvHM1006b1u7fcqhxNWxjWEwYRDDol63Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19htp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:55:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so41563541cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239736; x=1785844536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DOU1u1YKtdyAp/LhMxU4Kqj9bya+6a0KlguSVpNf2bw=;
        b=aNRr0LkRQiSJQs8BC+b1CAbxeRla1EySgsFTjkMd3GlHcYCClp+j642NBaAgPu6496
         u+c6wmf3ReFDt59BtSpGe6ncNoSGBmy8FUo2ssYiGnLTG6+c2R5/WU66tB9J9kmq2AMD
         Zv3VZlTCoL1EQMkzSB5yiy2EZeegqLuxPKjExk0QjDJpkN3KOcJsHZCgKYx9GKf4B6jn
         Ia3yhp2c+NxWtF5J92FXcx7Hc0R4TOjK7ZqoYQ66oOjHhOxbKUqVyzjRUXvfysQYZkSO
         I1EB2mKDyasTvuOI2hre/A2N8f35zzmBpBG+GnjTfDVjEbfoP/L2P89mIE7+jyn4GzjR
         Gy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239736; x=1785844536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOU1u1YKtdyAp/LhMxU4Kqj9bya+6a0KlguSVpNf2bw=;
        b=er9Z3ColzMbH+7hQxafwvWKyiadG3XWThraucry9oYQ977+MVys5HlkXm4wPtc7lUv
         rH9ijKZh9d9a6A1lM3Rkq+ozsuMubAW3nJVYeI100tv6nN18cXgkhRa8EMjgh8e4ECbO
         nnexvIIFw/Idgo2Ac9a/tbLNFgjsIh36cargpg3/ljw6sErpwa4mCJnBt0lWeaEZXUrj
         14RDZsa3U9AMz9OYZAXDuxIB4A7MJPyYJMFK9IO/ZRB1R0wPe5k93hZVd7VX7Uafs1uQ
         BVPbcpaXf+wahfBzkr9L8EAmsw1jJC0c/SCdJbry2llyFEOLU+cnxcgvA8SJ5lZ3tEZX
         40Vg==
X-Forwarded-Encrypted: i=1; AHgh+RoR3mweeThYw75PVmlQEanmZZhU/jERhAdz1/UkktY5eLfyeOTDu9izgvuIUqkdgttroCz29K6DETshDlTq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbh2+VbWsGYSTS/c8mCHjDNRdrEwngmM6IKBShXxXaa4fHyxPq
	ygTiUb7s1Xp/MEHWawFy2ir8osKXHt9JQQr7ahwbiEpg5Q0wERJPU3Xw4wjrXwtR93wWoR5EmV2
	/wcs4xpQ9Eb3zMiSLOu5VN+FLe0o4cBUxDF4Cwpf3rcuhY2NcFn51KJ8IXrYYncbVZq/q
X-Gm-Gg: AR+sD13zRuBCA13a+cY3QAmIWZnE68lpY6K7Zo+AX0ECJsl+AqC7uUpgkl/FXvRlUQp
	tA+Q+5yYQS9u2r69ZoerkdQL/RYCDq6tc3zcufw6JlP6vSjLixY8YZKM6zH/tx1gFJLB4j/uSq/
	+MKNtBI+ItRLILJmalklW+7lHRUByBOFQGigg4o7VKTIXU5B7L2x1jbnDIetgCYY/4kk52a9jZb
	KgaYH7tsZSgW0ob0f+nIypTodP81uiH8/uMy68WHbc/GZRlY2rBlz4Z84ogc97QSmq174+vXVGq
	c0UxlK3gvUdC/9Bznaj7ND0LTIdznmRGPYJ3lMhi7DwS9oG3bc+mMMEbXyJDppjYukDDx9oUEXF
	bTjI0K9q97Upvcao=
X-Received: by 2002:ac8:5acd:0:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-529d7115a62mr14953131cf.32.1785239736389;
        Tue, 28 Jul 2026 04:55:36 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-529d7115a62mr14952771cf.32.1785239735738;
        Tue, 28 Jul 2026 04:55:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm54282332f8f.29.2026.07.28.04.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:55:34 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:55:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qmp: qserdes-com: drop duplicate v8 DP headers
Message-ID: <32ua5qkgtroo6vcxjgbr2ymmev5sese4cttf2fh5qvgzgtbnh2@6bxmeemceqyf>
References: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a6898b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GhE7xFz0CRgom9ahFPkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX5veL/Qd/mCqP
 uJG5x+cTCpC0rb/lxNo49HG6UgnUGAIv9zuW17MOSeY3+e3E62BG+9Mb9SCSgEVluONd+A5h1th
 slpQ5hsLErS1hBtOAhNb9pmgWabypTdd67xOvwHoBZwb4SSfj18aOB1frFct+s16ItDsEPOPpRG
 MaKEPKE8LzQy2CnRxILX6Ui7cjLcyBwVrUc8cmzywSZQd9dqT231btnI4CrIhbEJBopy0atkd/q
 px/YfrmBCMRc8gK8kIRxxC0BBNZGMz+FyiZfYfiQKbsDUz5vZt2kIuAXEpM909wSsWLm2Fz6mrD
 o2bc90koEb/vQHxIr+6Shq93KBqo4izp8trW+0l8W+zzadllWW9aMvlQW4vPm2nn8+UjoZmrlyJ
 /1ZxEjOYggBfb9MNUHHMOBnuBSwDHmhYyUPGUu0W18y3NEMcMc3hotg024EBxI+DJkKery0EP99
 I7YtyTPRRyT5MOUN6PA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX8Mx9c9OTl1VW
 c1BfF2I/ssPv3O+1XUkGpmofyPNRg11q0lE/sLbgwXo8TFIN6tOyuGSvGYHmRkKb7kplw7ag39M
 ejTIYmdCYzUl5RD9vVP1+QFo/sAvI5c=
X-Proofpoint-GUID: uLbWOeqtNzd1H_LoPyWqJk00OJkBHPVS
X-Proofpoint-ORIG-GUID: uLbWOeqtNzd1H_LoPyWqJk00OJkBHPVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280105

On 26-07-22 13:34:42, Dmitry Baryshkov wrote:
> Commit 212cdedcac11 ("phy: qcom-qmp: qserdes-com: Add v8
> DP-specific qserdes register offsets") and commit d10736db98d2 ("phy:
> qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> added identical header files for DisplayPort-specific registers on V8
> PHYs, having different names. Get rid of one of the copies, reverting
> commit d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
> settings for Glymur platforms")
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
