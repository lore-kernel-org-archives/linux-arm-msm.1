Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A369749F128
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161525; cv=none; b=VkpGZQDPa1Aq+gPjKNcF4NRrJM8KA1eHBmpmAIZRTIegRK1XeL5TgJezkmsZBx4TC2Sn/xi4iC2fXhVBMCfz6NH8R8t4ooDq+p59GlgqtaXe4egVnJ080thOzGAK1PJleXZQ7mysUbzBhwMyI0d+15eY6RjVLC3LwJmCVh3ZuRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161525; c=relaxed/simple;
	bh=bqn6l4iYdSOuw4aeXmyQs004lZO8LwBG9YK/8wnvAZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSb2PWymafsL1JBgdZGPkOgebrZVPJmRIC8TFLmUa04gYSbEiFCoWwJtKFniPbVnJcuhrP2OBxVw8qPDTF+CZKvMqfFegWaXKu0cBT2y2VtoyCAzO6TJMf3ROp2mghiKDnO2eZuRTuGrct6Fw8b3vVBoxRv+0hl7M2kIV8s/Nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsifitFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggX7aE/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsifitFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggX7aE/o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3D242262150
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=; b=YsifitFZEhisGooO
	Drib5a6RQR+GHx4EltajtUmLprp7Vnic7nEWaijgrheQAyOCSocH7wIXG46DitSj
	1SLKHTVEsXVMnDRKPYfblNUHalln9XsqFGiB/H17uAssa+6s1LJnejR6QIEnV4gT
	p07I3tX2ZDfpOAN8lDZp2BZBXN6fr9qwxXzNO/LrY6tMSft8iXCXMk3nbMMxOyJm
	Wf6WFV17EB2xy6chFs5BL/fn15oSHDtvjc8MLTCJc6gn/SlQFba7OG46bUFpUrJ6
	OYaq/xQoik9HQpJ69jWgB6GkeJquhok+1NrtYbztaUoin5IVfsOA1OTCPq8DH7SW
	elPIkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3p4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:05:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so2042450eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161516; x=1790766316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=;
        b=ggX7aE/oJ7rXDIXBJRmLJBj3IGziDu8R872h/NLcpUOK2nFAmj2PUq4fj8jqUITqzL
         6LF8iR3obASRjyImDU684t5ryspBeFCByDWf9ZXgjV4fNOvztM1lZmVKMtN5A0vds1rM
         3+8/4YpxkJRhjWrEK5Fta/H1bPr5mT2RlzA1Gz5aRpCrv+Vo8D3HDDTeKiabluI46XxW
         UdvESNkpbzmw7gVlDKZZjwiYyQ4bzfJwxhphQngC8/u6oXNAZ10LlMR/ZMqHIB6AzCuI
         +94DXIroouULyDBBLOl3GUDgWv6R6F/3ARXCIKAiGA8XlGtxKMeGk1N06PSsvFDRVwV3
         WwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161516; x=1790766316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=;
        b=McDQ3w5jg0gE6ZCrbBkq9VyN2H4pR8dEA8MhZIfogSo8GA2f06wK+LCsxMuBsSkChh
         /JMfBzrR+/8WOgmoeRi9pMs4Ig2NToGDjm1nMf6npGcHLi732az3KyoDaz17yiIZ1T1G
         lcK8KLPirqdwMDinEjHxyiruD+W7gA9B6T3cbTNi5o/XUSnm/5rymO+PJauNZs+C/Qww
         5KEbALCzr0upeUX+FE9561lAsf2fkOYhazKjByZkU6ZgBamEG/3FuNcYU9axEhPz680z
         NLSRNrcjFMPpGv2DYNB0ys+oXQ1P3EdcX6aLLW0uLrOxW7Syu2fQ8+RnkyRukuu2Jw6O
         0Z3w==
X-Gm-Message-State: AFuF++luN+5c3RSQ1u5rcj3Lktpzu/t7BLqRN7DVGwvGMUGN2GZjNHhD
	S2VdYFXZOXjq91QQoOo+VmtdBtfSZL5t7uzQpo3W07VT5+zNtDITcjGb8KhXSwhrvcMoE6AZNJq
	cUhZX/GKSyfYNJYLpRRdPkbpVtm52uguzLOHC143r1Uri5G0d9XOswocFnvGb6dcqhrcUYvkePe
	fA
X-Gm-Gg: AYBFou2xqwIwhMktwMUh6Vm9O4FNXL5M3HsEBrgXWjOMLA3ADRpRNVlCnVtegWxWmCo
	MJCK7crAKki1e08Hm8cFA2rY52tdajKL4uylq6MlDA2wudGsWUHHGBqxq8XHPOCWPptLh1KSaaU
	KaT01LK+KtzWiQXnAsico/ETYem9KXdLehyUpKCXEt429wXr+rTmie+tLHEjH68J3LZs6e9LkGB
	f2upVmM9IUeK/kwBzdlwReFOGGotzDy5qiwb52iaSKT8MOm+dqRBxVtUzrjjl9H0sJq8mBnhdpH
	xBtuK/BaCj218Wm6YcI+dcOmli4t2/iYhZZpUL/vGRZRcnWXLbdJGMzx+E0TcdeA6r+VBpe2eC0
	uQ1lXfw5TzgTkel5z1+/fqlAjmaHK9A==
X-Received: by 2002:a05:7300:8242:b0:33b:db21:9877 with SMTP id 5a478bee46e88-33e8d9cd464mr2014776eec.20.1790161516411;
        Wed, 23 Sep 2026 04:05:16 -0700 (PDT)
X-Received: by 2002:a05:7300:8242:b0:33b:db21:9877 with SMTP id 5a478bee46e88-33e8d9cd464mr2014744eec.20.1790161515889;
        Wed, 23 Sep 2026 04:05:15 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:05:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:46 +0530
Subject: [PATCH RFC 15/15] arm64: defconfig: Enable S5KJN5 camera sensor
 for Qualcomm boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-15-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=708;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=bqn6l4iYdSOuw4aeXmyQs004lZO8LwBG9YK/8wnvAZU=;
 b=BtMxks8910ezL91AonRWICuUmO6BybjXRpW34O+cKL9X7/xTV0D9Ks9n9yUFV5WtXfam3m+fa
 Sjm5Agw9OTJA50XtKxXrPLrNgIhqSX5hLQSEmrOZCA4kQsXcoINDM7s
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: e120sVEcqmdWrUBYN2YUFL138nCyjyFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX6fTclxOfMYfI
 ZVVeBwI0bF/gUWUvvivv1JKdCiaN07TqqmC5Ji7td31qld4U3mcxQWCJ7h1pVJjQGEhizpDYfRM
 LN+xdst5G9KhggSlVvRPYIQ/T6gy2SA=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3b26d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xpjZ0Ymiy3z0-qgt9i4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: e120sVEcqmdWrUBYN2YUFL138nCyjyFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX/Tjne/o+vpkb
 W5uZDv0+Jb2Vi+y0wDQW5962YdUHJyZk4C/nwfp7DoSeSuRqBLEOWvX/IwUWqoZUclzuPF5MHCL
 rIBGl6LHwhH93qglucGIlrM6SSyQ3fuhO0SXkpQ7yzv1XRwbLZS9fXiQej3hueoB4lpxD1iziab
 oowVLwBA4iZZazROSvCJhg+s7ZhlJUZSx6BO0tsg7X6sLCQ/FFBW1ggBomNou+b1/lSj4xVogXG
 aW/4GIiasHn2GQposNrYcnJYn2uvLpkzeZqauX3Ae+qEt3m82fPi1lTmIN7+hJbvQPev0zFhc44
 Or08acX6K52tJDExwVD1j/gb+XevofVx5C2JyeHhTp3uyrqBf8pf5OBCYhd6tRYvu8MrxDzRRkZ
 /wfdEz6RKy+E4s5fP7E29VlX3wTStV/YgHmrKL0QZKeLioPJ5uEud6kwyxNuWOHNp9L8waMs4K0
 KUWyfquiYt+BRUsTRxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Enable the S5KJN5 driver which is used for the camera sensor on the
Qualcomm Hawi and Maili MTP boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc5e32289e453288db0bd9449d4c6f..fa35db683bb253e83af6bb25f702e3127761c086 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -960,6 +960,7 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_VIDEO_S5KJN5=m
 CONFIG_AUXDISPLAY=y
 CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m

-- 
2.34.1

