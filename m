Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178454;
	b=AAIa834QJY+oHopHFspSjrII7Oh/7e89ahvu90xuBGLfpUDPOeHVD4iOVHraD00p2FjR
	 4zwlgmkwaMXEPmQ4m34WzKWtmWd/BKY+1g202c3Q85LKx22ZDDBF1cUL8usGOQJzc6Ud3
	 aJf01BFPDy1CnX2bB5tEYAaWIsa1FgMkAdwZArd6vxaVO2IboIJPAx0GVaTyBovuV3yR6
	 39W94M8YLDIFiGs/swvqJCr33Ic3ZQg+OOUXPjlSeK7QUm+GVYkSQ4rl83TK++INtWVc2
	 Vtod0Y89KKOo2kzCDxf3IJU4QFCA0Tmk2syzcWXGqHxKYXxQwC+DKQsOnqWoXds/8wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
	b=xgMIe3veYvzNz7R4Y1duT0AdtKU0kNJXU2Ry4VAYyogs6tIAlFK0VgouFKwPGQcse2RU
	 XpbAziftSyUt7VCZPwHWppFolGE90BsYwetfWjE9rQCN97JV1Ws1Etw7YkCWb+vc2wGK7
	 18d6nriVa7SRIMS6CTxLEJDja7Z84RHsJtZkby8KipuXmn99f8GYAQxuivpgJlQEzwgBT
	 9xamxAR5qL5S4wL0tsQV0xoGckfchKs+JDtE66f+hevHfVaBoyQMwQ8BMRJziwYaUVLaH
	 U7VZMyvgEjlPtHo40yqyY33LqtbbLfZfDgPyioCQ02zNPbVIwnVzfm45SFkMMat4qhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBxjmaAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnKocLV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C7D606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C7D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBxjmaAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnKocLV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjs1N3731129
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=; b=XBxjmaAKzcY5UscK
	5YD4LSx69w+xCTAdSAr9bYg5ti7fg6Ha3cav6oQeGTaO5APW1wq050lAb7FTHKgf
	snUBdfsNTGm6DzcGkpLNyi/Lwd4qebVXpIO/9HSr4MaWiCNN+nT5ffOL/x+rCTXs
	p2K2zJdr83g7BC+TYJfP2mshHR11GaZaCF63LMu/A7MUCyE6i4SEQYByH30XEAqg
	BpwRh8K/ZHF1wjx/mBvX+2sacp3L9DV2lJmmtGwpElOAW5gt0+uaZQHZ0gzHo+3v
	YEXgRJF8L+t3xB2G9wHpG+T4J5gsL02XPaY0tTwAl4SR7wG/HJ7qKjHJk1PrrbRa
	INUEJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gf86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:40:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so184753085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178451; x=1795783251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
        b=TJnKocLVeU+LkqTAJDdSmp7HlO6ZrVVOSy9A9YjHbhGw7smjKhmtijpNMtCQw4yQv2
         D+04BVf40w8JNzisPisc+qX3DJtF5kaHOYK7A6l+JrupeEp7RJrc9g6skPi4L1f+M6Kk
         gLwMjEPyd0Xsdg4pP6yu8z1xsj1QzJbpx97IyYLiDlmVLqEasAAa1hqTpmg89W57OAXi
         YYDEt2a+GGGZtgENeYTgVtSXhFYmp0jBeI4qSGArtK8xYt8FYVqdt/KDIJFe5BD+bQjE
         nHruhlL+GH77Y22cHzCSKv9woo1qcp5kXftP/uzfEHL4Yq+vAJxjMYsJSmt1Aaa0idDp
         nimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178451; x=1795783251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
        b=U4ZkIQvBWzksSodlVKMSJcnqhrsDZqdjW4Dbw3C3HEHuBvWHZr7TKQW7/Kgw6q06nH
         GzRmUQCooiWYbn8wpm/octO4e0sSctmmvaQt5y2f/9JrZwEPNnII6o9J1em1kqYJtnLs
         3aqeR6ZJZDVBsnrzQrjlSLMpTRg/yAfS2TOhfwc5QkpGnXkPEkRcqCPwxk6Y+y4hZaGV
         Qis1zfFNpqxspb9AG+oaXVg+r85C97zI/ygLZMZknCCARGnToWF+O8/qZFOAu5k1XqKQ
         fLsZUC1roBeYd+AvTOrJdbXMlc7NXbybcE5ojbCZGaiVGK59/Nm2RN8P6l1fUmTNjuxF
         N0MA==
X-Gm-Message-State: APuU4Z/S4VpvewFmFM3hFkmkQRQWprPiDiSZkfVHTFnwUQ6ftQsb0uUz
	9sK5xoXPrtReHXUiSlpXSi0nSdQvPzk/GGtyF4PrUmA6W8WZBs37QenCzFp80iTFY9B9wnsMxm0
	5u0ncDZSCadWj8f8wpfb3GiAHXXlwygfBrck5CGzq8Y4UrgGKLdHX3/Qds1EGYz0gPUt/
X-Gm-Gg: AYBFou03C5Zrl0Zin6HMm8dmcdFgteduahgwSrxWTt1do0kN1EPYphXe5BfgoPuZ07J
	r7D6NqNu2+sl1/I+oEq8uUlO63dqUSJL4FOxvgGw8ptHUaT7Ktxkj2c61VOYgm/k3Iq90Z5rl5X
	L6eHz1ooVE5WvXjVLx6t4e/KW+/CjUB4qCpjv6QFh1qMQeLUQRORpsJlv/AxbgsTv+uAciTwXiG
	ioVmY2dW2B4aM2maVn7gAUVTMkYueDMgJHo0l328t5r1+Y2PZtmyaa56WxJeo/ZVkO4F+haS/FG
	6W17BioagZ5kMGfzVaIvLfdkiTt1JMjzKfXkklysSTA1xCuANG8TuFNY4cgk2L407SiJ0gt/yyo
	WzxLRwYaOaXwU2Cgv4U61axjwkxNRFtJ2GK1EdPjBvu90EJeidqSoJcLomUqpDPQuEU6JtqZg82
	k=
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr475451785a.6.1795178451421;
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr475449185a.6.1795178451020;
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm4234481f8f.35.2026.11.20.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:40:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix incorrect pull-up reporting
Date: Fri, 20 Nov 2026 13:40:46 +0100
Message-ID: <179517844379.14049.11659157399777710304.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
References: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B2iL61BGySrHrBs32DwUza_ZO5fc-q_t
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b003fd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4VXmX0JWTMGhj3x2HrsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX6zFjZo+J2FEA
 ugT8bfcgAyTrGG8SIqr1NCKPqOej+T0PZGP1XmVBeIRHN9kkFm5eOkPbk2LhP4NuPrMsmaV113A
 2I1Kn0JKGs+HAS7BFZS4Nzjzcz+bxVQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXygp3Ggv+Dd9l
 sihB0YS7W1VRH+OfPE9d+8vr8rLRHB8qzcyRw0w8KjWJbsWDf6PTK4BGinWnZGhC+fPRDcR4ZgX
 i1GP7OCp7rM3vX6rhZeUg0jOq93YkGeKMuYrRe4xmBvvH7pyYP6C3vfM2Rht3uRKwydOsXwwpm7
 UGqpFVAvU+FtlMpdEEkElt1kN4pYM5O9yScKQeSshrkLuan7PyGUZJ5ZG6XTL7NCYKt6m8PQitw
 PajiAJk8PMSPm5ua1UsTGZ5hxl/g5qfUJV9H9SmYuYAKQu6uVzNP9NraVA27Yj5G1YGqyE9agKa
 xSnBBfXPIuLUNdbLwJRdiNrg3qNF8St9TF0So3EW5BqibeIgPCfXoE9pYqv7Oxhfyx4OtFoCa8s
 kQ+c9kxK0njvyfH88yw6MlZ2+Lt64QCws04MCHHOdaJEHhcGNUbvd33JKEJ6KKgYVspHtnh/QVU
 mhtK5eVdTF4nirCe8CA==
X-Proofpoint-GUID: B2iL61BGySrHrBs32DwUza_ZO5fc-q_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050


On Fri, 13 Nov 2026 17:11:27 +0100, Bartosz Golaszewski wrote:
> In msm_config_group_get(), querying the PIN_CONFIG_BIAS_PULL_UP parameter
> on non-I2C pins incorrectly reports a strong I2C pull-up bias when the
> hardware is configured as PULL_UP or PULL_DOWN. For non-i2c pins,
> g->i2c_pull_bit is 0 and the condition is always true because BIT(0) is
> 1.
> 
> Check if the pull bit is non-zero before comparing it against arg and
> match exactly what's written in msm_config_group_set().
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: fix incorrect pull-up reporting
      https://git.kernel.org/brgl/c/590058e6f640a79ea0ad114cd4213a4e4df27d07

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
