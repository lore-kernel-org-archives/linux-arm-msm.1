Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9863D093A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171073; cv=none; b=uPXNi2WsAKR42JN3xI2zjGLLUyFF+H5t3vWvhVfIfhyiVwmnVWKeljjFiQybWPyYkYmikqRrwqIioVXUhtTJJkn9b0SsM9PXUEvZE8M6A6an33hNkyxWcy31PBfvGmb82jbJU0JmtrXfGXSrWaQZO1ryoULW/hfofgBYjC//6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171073; c=relaxed/simple;
	bh=sauhIVUQkKN5CCmBb2DiU9ojVkoyQVbgmp85jdz8/QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFgK8A08Ggj4ccKdE1Gs5DQrvPK+lo+SVqPtkdbdYzDm35PftrNyLywTPuDHEVp9L3zggl7xG3roGrBX/nJWfCZJ06h4BDpchR1qQN8PTC07Xqlekk+r8Cy2mCYgDzE8zS2XWO6C3Ax38w7wyAPYidpaMPwETpKddH0qfj3RUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne9VZNKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chFZn/ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne9VZNKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chFZn/ph"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9A7VS3182574
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rVM7AVLrz+ksAn2qj1Eoa2oCeOIdrkP6V4Rhur8wHM=; b=Ne9VZNKbshVlVPlD
	AjIdHnTP4HL/jnVyWdNQ7PWQNJuGrYCOk5yMd3/LyCOyRgFSqJkdfKiQLbRv4nON
	S0z1L3F9CiwVqi7eU9FRpB7ldFW/3NB/p83MXAgcl60SxeWG+6DaoWNdVLcsjHGc
	90vTnUaXBk1yHNSMAP0/+RPBf858l2QzdScQpFwM8j4G/ROFKosBr/iyOQ1puSff
	NORV/OH30Ltx1MlS+Ty9NqxDvo4kMn5iLHzSlEHV39Iiydlr2q5UN5A2BqyUrj6V
	gplsfaVNWJN3qgUaoBXOCht3YjiLLO+WFe/eXjngVO/5A5+5ww7ZMEi7PpzbCkkS
	qYQhyA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb881d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:11:10 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37733badcso5617371b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788171070; x=1788775870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rVM7AVLrz+ksAn2qj1Eoa2oCeOIdrkP6V4Rhur8wHM=;
        b=chFZn/ph9j5QVpVht0fZrtupCDHzJ0uu8fuo83hQv1f8yuJ4mpBpW/Xw1PUgDjya/f
         s6l09P9S/zHGddd9bukyxh+SFn2i2DgTADcVLLz4bodxBmSKlX89npzM249mrMS6DIN8
         E96aq+gflZa8a80o0qiPdfru0xYfKWoG6iIxUnkoGoaTY5QZQs7bdRKaK+gJy21sk0To
         P7uKXVzJoqQRqTA0JfxhosGq0QusO+nQvKshGzaLOU+w6G4FqksXElIMOT0zuVhpWkVd
         IRE3Iaa4Y4YdxNwo5iEljck+aL4RgYv3SJt5Ajx0VrhEOYMN7xgHRaFoXEedzf8P38co
         1s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171070; x=1788775870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rVM7AVLrz+ksAn2qj1Eoa2oCeOIdrkP6V4Rhur8wHM=;
        b=nZhjexsUbgQ2CugeunTXX8fzlNTNLV5r1S3b0q8xvfsbEeAfuyhFPZA7B7qTzrbXUb
         FvlHgzBJIzjhcBIvYpTitMrFEVHbPsGZivcJA+vmy+RAKlDtuLdaoDhYo1z0sfDdolqQ
         yY/i+6+DcBFkgeKca/2DDTAY4/l2HA6AiYFjekDYq8vFvlFinOtmPcSj+gyeURy4jLNi
         6SpVYh2PqdO/R7nJR7PRhwhkDtDRnOCSchaN7FxrAKh/Qr0Q/30F+Pj7u+tpV579n2xd
         hXTmrLzfvWw5wFQ0NF34B6K+mjMVLzFE29QFqhj/pv48QQH2QSC4MuoZqu5Ihrgyk/Ik
         1yVQ==
X-Gm-Message-State: AFuF++nISjNlMC2KN70FA0zUzTlyxEk8/7JvvrJf3slzEYg83arGTXRx
	sOugMvKqNai822b9QIqE+U1u95jx4s2pd9ld8/V52vFdYTviR+xIdffwSeIqSv2gDgWybvY7ypH
	1n10MbZVVbIc9Cs2QyLAOfTIsnHWvK3VEuSPsb24+NUy7euuzTtIXFxJ+rS+PCWdetTtwUHQloq
	vj
X-Gm-Gg: AR+sD11phKUbdWT898tccq21pW1dZ9F5YVEL4qOLFbKfUtfsViyUojEzdhst/GWnCfk
	mlFF2bvV2fcsJ28OyeY5ijAjDD8UO981dVU/RUWCEaz2IkFJUep6pRrLseDvJtKWyK3mDzYwjcZ
	ZNGsm1VPIFX4XYD9yCU7z+62Drkaislpa0ft0cuac/rDZToRsOBC7nKy8SyxsmRHdceWSZx6WdV
	vFlk15FTgm+UDRcinFNr+IUTgIGg9V0NQ4cuevFsJKmC0vIY2h8WaazObqSHvFbCwEgSPrmhu33
	32tOViT2ae/5TXA4Zk2qUYx+O1KdBRWdBFnhIYZdZw/oMdmstGv6OHckYtccHneegI/gUI8K7jg
	9ymtHZw==
X-Received: by 2002:a05:6808:1983:b0:4b3:7549:d3c0 with SMTP id 5614622812f47-4b3984a5d8amr26905944b6e.18.1788171069783;
        Mon, 31 Aug 2026 03:11:09 -0700 (PDT)
X-Received: by 2002:ae9:f104:0:b0:939:116c:2f5e with SMTP id af79cd13be357-939138630e8mr2303822585a.19.1788170601717;
        Mon, 31 Aug 2026 03:03:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:03:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:42 +0300
Subject: [PATCH 2/9] arm64: dts: qcom: x1e001de-devkit: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-2-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sauhIVUQkKN5CCmBb2DiU9ojVkoyQVbgmp85jdz8/QQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVABL0lInaEv7U+q2FrsYdLSN+6fodL2Z7e1s
 EbpvRtZpsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAQAKCRAbX0TJAJUV
 VugtD/9U0XJlBhptO+t3UuiPKZ0ggY1zpTnVmqGjdyWKqihddVHyYnj2JWHknYoM7HRJMUNTWtO
 unuh/wFIIk4j/7G0Wsjm0HC6D3oryDveJCRlNKc5h7mPeCaVHNcLsT8q4r6hRPZ62ud9Z07Q90k
 ky+J0VMzu6a1ZiM0i2kjV70LtFYRH27SlGNVD2bNh9sUxYUwmIAPCuNjl0YCxdrkWzD7p8mZ1CF
 2NUcNUDVaboN4mHJmBo3qgaYqoBYPJjJ4DSIsfWClYhQCsL5HLDClQ1X+Wg9D1XfpG0/LxYRwmK
 PfhRuueNSXrK9OSupGTxU94yBTnGEIhBYB5KJ2yn8EPdMP6siXS35VOB306/KxNtztSgE8DPhf7
 3bMGXxYz7SavKbHWfvkjuceeV/pmyFEG2U20wcFRaqssOVLkybpMe0j0rce6FAUffCpSIot5I5i
 AZRiYVDKiuM76HWhkPTxlAzdnTMR964xd0wsGsMXzKTxDxLUIDTvI+ujRMEniYpxhWLNmyt1UUE
 b7dFDzrFY7qj8ox5vJpO+nY3qbvJeOc/fsFgAZ/+YV9JNiKCln0qRONTDnorFb33NqzL0YN9gwF
 uoGLCVc93t4xlkCOQIIGfRA/jBxFM+Apb+bvdBtCMagdYbp1WPbXetN+BKbwTKKeXx66jM6ZgL7
 q5s8FqoGAMNMixQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 5wFwUuYBUbvPvgjA9L3wXN3HesD4mr4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NyBTYWx0ZWRfX0WHqTaarzLFV
 HiCY5lTd0DvqqI1LQi+qPdEdV+/1kEh1aMTWYCVHtt3w4SZs4/xC4gO6cIM5Enos51V2wF7sV+p
 3gunEVXK99OO/WwOF04pCk7Wp1VIvHWX+fYoc2iKh2JERddJJg95m1yJqxQJMM/7DpJqO4FnyKF
 lh9rdbxEjLJF8Y6mpLo0E13MncvIBrVf/+33zWyPuQzE/zWbrgRJlyHQx/XncjWxFXl1431jT31
 edd5nJe/55gsMcMmj3Ca2UVqOg0E3mSauhEtSzCTOAsncl3IHAbuYFE+k7FDBN8OGNAFM8ra0se
 Z8X3UsoSHLTZ+RjRiDvonvo2n1xRBg4/wNhAHljsctzX8zO8B1ws1mTXEJEkOhXUeFrwX7YQOFI
 bIq8BZ42NlBhHglUQLqwOzd2VIMkyqzRewNl9CfiOpCGhbKwGbVV/yGVygsFUwt6/xeUr24fUfo
 9N2zhhQdG2RZ9zve0Ug==
X-Proofpoint-GUID: 5wFwUuYBUbvPvgjA9L3wXN3HesD4mr4T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NyBTYWx0ZWRfX/+4NGmCw1qbv
 tAwlatiOnpQk/h46a1/rqp2yUxytT2n9I6ANA2fUWQOmTsdFckd8neFuNFpJcLo82mW+7lI2BHx
 THbz6eg0w2cJlc2jhMT1Eth5dw8ySto=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95533e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gnkErBHEmTjFWuL_1-UA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310087

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index be1a8ac8c699..3ba45a7884a2 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1194,7 +1194,8 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";

-- 
2.54.0

