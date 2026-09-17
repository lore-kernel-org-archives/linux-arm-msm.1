Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55924D4886
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659613; cv=none; b=fQL+bh61m/nGsy1q9iaNZ6zTu5QgXaiIzxDJqn5texwvO88dzuF+Jrz+TXZ8AX3QARJb3QwdEUf5XSX0pYtEr5w9KZWEqYH32CslW2oynlJHhVWtbcHXR1OZ98Fn26A+iUQKU8O/8FKlhUj4VHgb0GvMmO6h6GknOlBDCOy4YkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659613; c=relaxed/simple;
	bh=9Ndxc1tBAF8mY91U3vV5DmTzD+UiZfbWF3i7EviwBno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUZ4pwluSSWO+hDjSlPk0pqK91VkDriCBCu8wo3RgAIpovQifXFlRz26I29SjkZ5WOv1K/i/yDCIRSqT4UeTP4iIJ2pfPdNsaCfPTYHUMgR5a4NfLHLTCM5bADa7c7FpKoiT9dH7E//UhUeA1M+G07XDH22Hgoi/rBZ4/B9VHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KF1YJoNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bv5C7xkm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KF1YJoNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bv5C7xkm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDkKa31714802
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VM4DE4C72pbzaP9G45mgFYM
	QivvqHf7bmdDimV4fuw=; b=KF1YJoNlSqs6+b171E4rtkq3IQDMjSKvd8JXOO0A
	moQIU0hjbwBAcLfsBRMDP5bjN3WvcmliaoUE4Vt/4WCi9O7q8HPoP6yNdSCDtgVX
	5KOPP2cRZEE08pCzv6Qgj/OOPBKmTgctcKzpvXtVX4xkh8FiK8PnGpFK17Y0QV9J
	sgEyZ0PZUOcbKSLSURYmK8lDrJ5UVptKEARcBDgh+AVO0YpArXf+t9ZPOhdsXPmb
	YozoPS2vBxxYtSQijKwLsVpBy6VO6Q5oJGu9ECw9jm+qRFw+bzko8vDThVwcwnnb
	WhN+LR+F470P2QV/YsxYFcu41jtMpuWDi4A2pJ9USjyLmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w9ymx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:39:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so180518485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659589; x=1790264389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VM4DE4C72pbzaP9G45mgFYMQivvqHf7bmdDimV4fuw=;
        b=Bv5C7xkmSDxq/vx4QSeR4QMbR0sgMQ39AvlJ+n2DHibRyLBJMrY6/hYkjTlR2jmmjN
         U5Qf8GkhJPse/6i6IAIIifjqDil3aZsbapcvGc7q6DihMXC7Ba2cyuYZeCuERxIZgvKf
         lqUJVDZPBrvveQhvmR4NpChNve+AbKJrJ3VgewX4mPwC2NWeHviNVzIpwGPNK+qTP6ID
         23G7WFm8rFVI/I6y0xVeXgJgSj00gKnb2gM7BO2ovGvIXTJHhsDXhd8VeMRsv6ZG+mOC
         BJjOg9kNFRhvRWdnhI4gOwswYU3bZQchtWOSie7Jxd9GaJCRQ0kdqVk54xSc/mcaRimd
         netA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659589; x=1790264389;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VM4DE4C72pbzaP9G45mgFYMQivvqHf7bmdDimV4fuw=;
        b=MvcOn8BVV4Igcyrl4yI5HMlj1RVB/v3YYBzhJNVbpYVT792s7tzDFwpjvJmniMtAVS
         NXz5TIMco8OMZf3557mNfvOlDF/sKTQke1oeZ83NTdW7Lmnz0Gm2wEbAqiOoZzLVPt0q
         zCFu/GGOqzFL+nUwioJPUuNVgZxhSFPRw+JqKXdzI3d2xo0XF0MydmtbOPzhGqhy2Xq5
         kyuSvEKVo/qa1ZW5/sNm/z+THVazA2Wa+qb16Z/zq1+HQavdFCEnuCaFQQFTJQaTx6RW
         rIutS36oLWAHSmvpsCMYS/lhqpm2PBiiBBXB+yfZvHS/lEeBewleC1WLQqzoq78KRxqh
         bTLQ==
X-Forwarded-Encrypted: i=1; AKwUvByiIEXVmsn8CVUBIpnjw0yGd6pFm4Ycyrs/mXslhSrfYK1wuxaSSF17yq27WT9ei2tpy6Rnz3CaYStS7LVe@vger.kernel.org
X-Gm-Message-State: AFuF++nQVUqAcqkhkNWIU6jG9IuzZgUMQcutY6JyGERHV07PoTjwivCv
	N4Xg1xb1Om+wJiF8osXZAx6YAEY+gD8APQNxnHXdD9s1IL9AYfv6w2IK4qu6dAgNqS4Xj3ToiK8
	APJ7F+z+7qvmaRX1DYDXfmu+nh5ud6lRY2phHUbT31oFCq0Bkxo8FvpmgCAWr325QGaBF
X-Gm-Gg: AYBFou2QrKeSH062e89LUn87r/atxFZJcCyYTrCmiEGJsK/jQel63JXK7XB+kAHn3aj
	bIe8UK19CgzK4yhAcKpxnCVLemGTj5Qf7mUq2yecWTdQI+uoU8h1Pts0ZCPhmvxKQ0T9g9P3kKf
	j05rrJlAPE4GFudp0+qc5WZkLtRmH4b8krciQUkmPfFJGVSzN0TnVf01tR7ai+3QnTxmrXXoNqd
	EFaemlWRP47XYicDlLCSEYbg6C02dwIvj82YXjaWGh3MwHloBEZrQwwCnBqnqBiJUoEKVQ9Fr+7
	Kh9+ZEJpi22Y19Srgcc0udWSFnID2avNR1ieP9S9K/R7C30E6Fr/LdK6/Vixtrp5e00Dk1oRKa3
	lU6UkukcKiL9D5w==
X-Received: by 2002:a05:620a:4049:b0:93b:d79b:9a59 with SMTP id af79cd13be357-93bd79b9ff0mr126533785a.58.1789659589110;
        Thu, 17 Sep 2026 08:39:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:93b:d79b:9a59 with SMTP id af79cd13be357-93bd79b9ff0mr126527985a.58.1789659588511;
        Thu, 17 Sep 2026 08:39:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm98570575e9.3.2026.09.17.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:39:47 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:39:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, sboyd@kernel.org, dlechner@baylibre.com,
        nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, sre@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pm@vger.kernel.org, kernel@collabora.com, stable@vger.kernel.org,
        Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v13 01/12] spmi: Fix potential use-after-free by grabbing
 of_node reference
Message-ID: <le6lnvwdpwdvfcnjupxalgpehqbuwerhvg35inzr43hie5mfvg@743uv5ppkpg4>
References: <20260721093626.96264-1-angelogioacchino.delregno@collabora.com>
 <20260721093626.96264-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721093626.96264-2-angelogioacchino.delregno@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX9hy2uUsUTh1m
 F3PNF5bMWlrbqHVO+9IQ8X3z1ee2sZUzDA4l7CQalxQZCSv5oIbrP/t8wgxmt4YeWraq+tBY7lq
 yQ2AM49So+3DTZd2vaFEoAE5ywELewTXJFAke7S3o5Z8agcvdKLJOBcQ2WvC80k+PL+DZufx6l8
 KpDao6PDWw0SsUYjeGALi6WbKBjqmO68PqiHfuQdRtktyUW1mF3hytaJIzCNqRNh4EMSc32kWio
 mx15FMUdTzklKvzZfnCg48GvuYq76vpfjQ+Hw0Dd+M8Q+c2c+rgpjtvR2ovuVCCu/9X/ioLCSou
 jvU0obqSVXm9o+MS1H4ICjBinwf1wQ4hY8TPn/yoqofYfc6QdUIk6O8XEpDVhapxCiKoZvHnP5S
 kaMOIaSzSGf8ErNHkdB7Wf5qyhYlY5Ulxcf9CFv7vlX4Ds3XGKqtzvemlxnbhHbAC43cg9xBEIi
 cwOmWldx60fWHYWfxDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX7JLafSQQy5Oa
 fe5LzLAqa/DNlPncNBu2QEmGo8BJJuHtlpLf4i0cm0ph1ZzrifODoaH9cpVya8XP8Zo9eIoWsZJ
 U3d4OH4Rb4mE9UFOVuAU1lFRqwocwlw=
X-Proofpoint-GUID: wA-A_lhdtYesuu7hhOUivnD5fhAiqevS
X-Proofpoint-ORIG-GUID: wA-A_lhdtYesuu7hhOUivnD5fhAiqevS
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aac09c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lMp64ggZct2OJqWbRbcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170222

On 26-07-21 11:36:15, AngeloGioacchino Del Regno wrote:
> As noticed by Sashiko during a review run of an unrelated patch,
> in of_spmi_register_devices(), for_each_available_child_of_node()
> is used to loop through children, and to also assign a node to a
> newly created SPMI child device.
> 
> Problem is that the refcount is dropped at every iteration so, in
> the specific case of DT overlays, a use-after-free may occur when
> an overlay is dynamically unloaded!
> 
> To resolve this, increase the of_node refcount when assigning (in
> function of_spmi_register_devices) and release the reference in
> spmi_device_remove().
> 
> Fixes: bc32bbd04011 ("spmi: Set fwnode for spmi devices")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260608100949.36309-1-angelogioacchino.delregno@collabora.com?part=2
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
