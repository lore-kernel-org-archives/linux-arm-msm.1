Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395228;
	b=m+5yutM4o7Cbzbr4/DQR1TwuNPw8ur6jREopjP6DjU3c64I/aibiHjxQSbWrNG2BMUY5
	 2/KAWTGo8CkvJczFzV8CfA0vTU8gkprPka/EvHad0WBQF+zeSRiXdOf17N4Sfo76oMKzz
	 BK6WBUpZp/YdozO9y538cfOIC9Jga99m+HHcycYGgOfKzJ62z9T30U2d1oLz7/ayjWYok
	 G+jgIAvuVcZZ9cFHE2645L8jd6o5OF41ujpZo+1HWknuots5MRU956xeB7hDZ6lCe+tOm
	 DQJwCVgHu4eUOufbOIgMx5wQcLdjFMv9iJqWIZ1zEOJ3o95ZgWq1lkHix+ZqWLpuakw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
	b=bxlWsSQ4y+fk5iN5oyANEid9ncTg114U8D6wTiiudeFMBPG29CyJumHtMOlbId45iJOf
	 QZvUZmfq1MenUnE2CbiVzKpkQ/LZEVfpT+xVe14QpPTqjrqboBiWUB11nK2rASHp90ktE
	 orKBSq7oGds3PyVw5OXnAjPP9ZZUy0NcsEkAH0bqKS6oZPltvdmOZ7V0y9sfnkFTb/G4N
	 jxhqJuMnqYYtV5ZA93MSeZUQke8y74+MmJU/B933l79T3p5EXLnAHcqmZRkZfppakYiS4
	 Jg4Ndypou4BuW8BGZKhLfQclxbvSporhtPp0BtxPgpeuXtNJW1T/lDUHHSuGlcnbXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqDnmnG0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFgH+w5C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3234460A2608
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3234460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqDnmnG0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFgH+w5C
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAaQx3852516
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gIzkbjDhFpI
	59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=; b=LqDnmnG0tWIWwKsZq66bHJAvSff
	M+1GFxdYhjPiJS3A1FoJvviSxWCP2fuLEmzmLMmWNLdb//1BhQVw0N62wAGLXKc8
	KRuSskhukULUuaC1BWqUiuOcsel5GfJofIOX1/fWhhuyWDhDFUH7eXhD8xeZUnuZ
	j4EY+bIJFuWjMNKTIrOucCjeoUNFYB6ZLY82CTQGJkoqU3mVmHZr6gtLy3TgL/c1
	wXpX6Wr5HpHiPJFatxOk8dxBvryuRVUIzt0+EScQiIQK76GWJ8KKTJyLC/GaudZK
	7tLWSKRYhyeNdcGz2Y4SHGqXJJbhF3FPH2G9VZFO2Hd7furn9A20sV168BQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x180u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:20:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6969473a4so736973a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395227; x=1794000027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=gFgH+w5CAREIajaiICkSvWkAyff6+lvaOb2qhEF9wusxHEk4hQLFMiDfZE+0fdnNdt
         TVHmY11vTWklL6ldPFC6nsiPbUadlTSMiNH4PS+TlvTry89U09i7GrqKJecDf6Ejiy+T
         lQ/8KISRdgnNoWdo98VWE7TdXadn1EqZlgjhodV5mAQiECD2Qt/gaSzBYQZLT5fh+Qpl
         Gb72z226xE0t1DXvKpaZo4G5rA3DHKZKQ2vuhLZ9RUsZ1/1KZuOEKnmj0uYTT6uFtt0p
         eXDzCVjF8y4QSOEuztZDrkXB+wbbE7XXzCGTFA9BWPVKlKPZxRIWu9CGXVEdtgenKKmB
         /+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395227; x=1794000027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=HjzntjeY+dZ8cMCNcKU8ovvfgUmvNkaRFa5sTM3kljQpGYMR9i6QOQIbC+zkMua4wh
         B/6uo7V1LnlslfHdD7vGx6eBSy/ckXrG5/ebtWODIDduk3cJ1XXlyoqJCKLmzFdYGMAN
         zW+gdrk2YCFZNAVSpJSRMxdl2Mc8Il6TetEAr5T2j9EpVnFDxFBzb4k/LmD5+UIVPZmk
         QGwhWZDNjdttrh/KM2djgnfr/uiQ83Ol3jqYAJWc2Skydio4LAOHhNdEoL8F+A9L7kRo
         PLkahCss6ze0yCkCNDu4YLt/VOOGpeKLiFLG1A4ELH6QQTbaKeNNeJjJdY+ukMP/S+VF
         maww==
X-Gm-Message-State: AFq9FYIorlqvLq5UHR7oIfNbhSPkJ9xDFdaoHidUJoTkmk6Mrre4cwMu
	xLrAmOIYTiemBCPNKU/J/SE8o75T3kcoefsCHxa5HtdO+upsr0c+7vvBBRMlVHcjBg2CgC4pyKG
	nNgkL2CrEbQQA7WYQkYXj7r/Bgr2VdfK3e/XEaRu1si8tHYvuvCsQlX1vSyxYDC78yo1w
X-Gm-Gg: AYBFou2LffSjD1kZ3mNcRDs+Q4a123fIImqQBDP7r7xvjZU6RQbTo3i6dggk40okjuG
	VuQP5kqlKVVrlR838Z77QX9NRwJmueeoZskum1p/EvhKXOjh5XmS8ymXIp5oQ/7kRCMs0Wz6zt5
	DOHNff+/x9Vjx6knfruP3A6IXUzSho2NON5+zbqR8pLtNsHJQ6dz3Omh7cizf+Ob6QhImjvbyPw
	dE3Oiilb8Web6qPSrLdxWTqamYEVHvPv1v5ORj/DFR8eIPOQU6VSM0RbLWjDLQmSEEIkEoX53e4
	t6zKI/QPvN5lYRrbWLLDKMYXQpO6Xy1n2+Hrn8Mw3P++7INrl0eU+FXN5gcglglNkiYp2o9y5yw
	Htt2RTLlKxXViQ+/hNTYPhO9aP3wDCVrItA0FChhkU84uL8rL8hGVCQhc+wAd4G31rueXVkU5HG
	xOOatZnqNPen8s/BYTD8IGQ30=
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr2636517a91.64.1793395226700;
        Fri, 30 Oct 2026 14:20:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr2636495a91.64.1793395226269;
        Fri, 30 Oct 2026 14:20:26 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm10464840a91.11.2026.10.30.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:20:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 19/19] drm/msm/adreno: Remove temporary __maybe_unused
Date: Fri, 30 Oct 2026 14:18:21 -0700
Message-ID: <20261030211928.45761-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 40otOPRf5_t1lDR0jwJeBOT5o0Cz0vgw
X-Proofpoint-ORIG-GUID: 40otOPRf5_t1lDR0jwJeBOT5o0Cz0vgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX4xVnDL/70Flt
 wVtmYLx62ZNXQpkfDOKAFbOunmKW5uRC9/wCC01zTJgzRrLUZcKDpG8vbR8UZopOAIlKp8a+6A+
 zK2vnqiEde7xrh66+GTLlmkz+f3b5eAKl8zFjn475m6JFLk0SYnwDt2tzTwMY9sd3FmSyaZqL4m
 akhBxq5hw3PALtThHAZ2ii4BL3loNcJ4LaEV0OulmH1SjR6EOLMp+AAuL9JlK6/kA0J9JrSa4Cd
 BN9A60beT/WzFxn7ZUTY1ZgKY1CQVgF0Pwm89l6ov15PHuTuNHDleLacVUC+HQlShgsQXxOLYeG
 wYkh3UuW2x/OpnB5pB1IR1bqH9s+LlSRqMJ2K/AKfVFTZcp/LOZRRBl2fuTVEzjMifzQWj7/B3j
 KWHMtxm3y3d1vn4tAIyKznLFHZ8y+TIHB0pe7w9rKi7lKk2T26miXyd79kh8MVIo0baxRl39u3b
 wnaUjwHbh7b+cdugC8g==
X-Authority-Analysis: v=2.4 cv=R92WitRX c=1 sm=1 tr=0 ts=6ae50a1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX/OvjyDo+uCFW
 cja+l99dJSv7Y4eTu7AlGCmOmclQ0TPTNPj1262qJwO9JJxIMp1Www+z+d8gCmkRti74KiWF1yI
 IX002wAouQarNFIu23jr/GHg+XuYZDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

