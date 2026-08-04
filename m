Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B13822B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844075; cv=none; b=P3rMaoo/liXSuecHfapfgcz1R4aUiszpUbEYWlnRcue0/0166YCoPWMSMBPNlOibvXXmmqgZank5b4VEU4u4jnkE9hChooz2kJg4NR4I98NRVge+TMOF+yi/xDQ2pCoPj17sEiFXmPhGwKrhRiuN3/2VhF1v16dPOcoZQLAH5t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844075; c=relaxed/simple;
	bh=G1A7cOuC43/fNsfoEkpiKhgkIubIHQ/o6++Z32Zkn/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af5D0TGAUXgfbFV9I8WBhcUUNQwfLgWKtbtl21GeJtoP+FOmUA2m29mKGezdxcxcU4Gs7FnN3kiUVl+VJhv9lrgEW+aSCUeQrV/8DbqyIs0vJKX4bjouhuS4qfNfjHtcaUub/YYV0pxkrGCJHXazIcrcQTWVq1yK8nw2XxQyWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOB5PI5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCMVpxp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOB5PI5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCMVpxp5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748BwL23016142
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5HlDOvlq5IfKTSd0JcK/ulBI
	iCb9/6O8tzxaTdb90oY=; b=LOB5PI5Ap3OC0Nxi7ryVDtoUHjKAVzD+2FKbF2/m
	vqgBBF/VCo488r1xdCfb4ux5netmBDqjhZuDK395Z9T8NBj4OGGPU6FVJ5CzHdIb
	uyqxvnJ4VX32z+buinVvLXh+IpJxgR7HPKBvCGAk7M5ZCm6SQ3ovhtuEHqI3/OYm
	7nD/fIIW8SnWULw+5leRyxgNErAe+KGXXh1D1MyXGhlCWWbtUwxykATlKqm3GaGc
	BXKbaKBE3Z9OwO+cUvpvAiRz3dTz8VQeTPdcJUgCIGZXS/wP7nXZeM61IMn03iBQ
	dzWyB4MvDw4KYeN0mxjJc7Auj4VCjP08iJKHoAzyBpT9CQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu727260p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:47:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eec6acbe21so95607216d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844072; x=1786448872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HlDOvlq5IfKTSd0JcK/ulBIiCb9/6O8tzxaTdb90oY=;
        b=DCMVpxp5OUunanUodNB9hI2LIvMCG40gitFv3QX+fwx40VLH1kjegWA4ntPQH5/G9+
         pKXiq0DCFFXVI3Ne6njxfLL671ZNCadUTbPIEv9F8sCRuDQYU5/e1xUp66+jxKkdCG7n
         y2IjzIP5NQl7PD6G8nIpaikX6L8CMbw3XZ/FA29ZXAPRC1gZgJHOyXTvOZdRYe5atTUq
         sBMUM/1+UjNYhKLU+29VH88qIDsqX8rVCAfjvZZmtzlUE2aoyo/vOLdiArW72K2OoQEx
         kCrRrn9mk1hDJ+zl/VWOCHtDFekwZD+8aoRcxF6mugd7ot34M/YFZeC5qbROXq+MlKoP
         GrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844072; x=1786448872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HlDOvlq5IfKTSd0JcK/ulBIiCb9/6O8tzxaTdb90oY=;
        b=d1+bwjmvYEqox51yktLPSw1sCk5hjs/5+TzYd5MaRjlOgAnHEXvTrbr1AkcNVmwiQJ
         JjEMewuy/I/EY9TQQ7Zx3X6LcRND+nvvSPKTiHaIPHRWOrYQ1flH707lVY6F8fXTWsPn
         6i7ug6Z6v/0d+z4TczujbzUJCCy+Z2Xwzk07xyNnVgR1+GgS13ivDV41buqs4aYX0wNw
         r6wi4L/AZDWVi88CcOv89KzOEQZs4UsQqExS73UJJV83Nect8qT+63snIZ9uW8zQMa/I
         J4auxBxGgtKUAw++17VYEdt/vwpYMKgX4DL0Bx0i2rvTc3/7igYvS87DMoy7dcfWWWGl
         hiIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3i2TZOlvo+/eUO7xDM6AnfYgUCVH2slcRP0J8ig2MVV/8UbG1HWI0813Sh82hdwb9974OrRN50rVgmG1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxBVJ2XN9rypSnqd+puiZLyi0CW21HWJ9dWNT8VrH/6EAeNwuUa
	OB7wRTTphCQwwirtbw5ZNuVle4a3xLE4K45DD3eH9RrdSDRtt0Wqz6nqCXCpBxGp326yCRajm4V
	JZ1B0in4czOX1HN8nWLAUXztMff5kCY2OffgABz+B9cM1ZLmgC1d+IOz6gNvI7/jQvHJt
X-Gm-Gg: AR+sD11Dmpky0ZhmQaSJCmfVHZxgxJX12o4JKBg+v46dy9SZBAHmzqri/y0CuwfTabt
	ydTI1Sw23CMNjYCPk+CPo7G+ORe0tqaQGf8BQyYb/EXd1J42EZl8GG8e7v+kNVPyZsxESZ4ZroE
	7Ex/2Xn/ojXSOWeY3KXeccS3ZLoRtozRqgG7+DQZDfC0zdKuoybNqgodz3gV7V+lmcy++XTjTh5
	GDVjnG8azhaZpHE27D6oLxviJ6uL7LwNJ45Jt12V+LIUNsreEf6kBE0mt9lzronjezW/Lu/+o5/
	B7hsjKDJFkA40sBHZteIngd0H6hrHJZhXoRkqHhzSubGcLGpOgvyR4KElDhr0j3WrYLn1uupjgU
	GGFE+RDpvFz7bFw==
X-Received: by 2002:ac8:7fc9:0:b0:51c:16b3:351a with SMTP id d75a77b69052e-52b5666aeb9mr244779311cf.1.1785844071530;
        Tue, 04 Aug 2026 04:47:51 -0700 (PDT)
X-Received: by 2002:ac8:7fc9:0:b0:51c:16b3:351a with SMTP id d75a77b69052e-52b5666aeb9mr244778731cf.1.1785844070975;
        Tue, 04 Aug 2026 04:47:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm45875069f8f.14.2026.08.04.04.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:47:50 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:47:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v5 1/2] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Message-ID: <sxfku6f3ypfzr3m372522s2fclwlzbbxpmjdoxb2yixutaquzg@yxki5dpxjqde>
References: <20260803130852.1432714-1-palash.kambar@oss.qualcomm.com>
 <20260803130852.1432714-2-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803130852.1432714-2-palash.kambar@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NCBTYWx0ZWRfX4s2UP86h1MTe
 Ej38BL0VK40TYp5jI/qpxq3hvjUdQja8ElrHk8GooT8ntJBj4QiHQldl0upCFsk2NVEimgpJJZX
 oBcam3WEEfTNSyxyyOiqWfMf2cStBOM=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71d168 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fE2qAJjRsTh3fKKuPQ0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: abTjshYuXPPqqmZp1bwgR50gw39uwtYZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NCBTYWx0ZWRfX2aahKDb2/UyU
 MC+pm1zVYYC8FpHjJQljQCewDQcR+HykIBGt9BSr5olU41Zr5QeIy8AqWW6c49ISGZJ02M+Ut5G
 RxgSOvOKMkhu4EuF45XVCMgXUAT8G2EI/4gkk88cCv6ezdVU9x4SUSZTm4boBaDEwqVC40jp/uH
 cXd18p8MGM1EQL1zO+oCvPGo3Qd5J0S3PrQsIhXG4YyP8kMPYZIhfojxa7ntzsMPUI74cjlWP0I
 8O++LA3PfMG04jmf4wJozqjUH/Vx8MoHYPm6tX3LFFjCEaNqjkrwZL9oDtphkwbuC1UMuoLZ38q
 5QE5XA4neqzKFmguL84yyEoI11/aqGMlxBOFKbwveYmPo4i9H1glJonKF60Z2uBuxlPDBKB2p+i
 LPRvQLD6jcvydDCXoLXlqOiMveXAcN4XC2J7Qzrm8ppAK+SwCq2+0D/ak5HFlpuKjaiD5hivd12
 /SnMwWYmNxXlNzqQjTQ==
X-Proofpoint-ORIG-GUID: abTjshYuXPPqqmZp1bwgR50gw39uwtYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040094

On 26-08-03 18:38:51, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
