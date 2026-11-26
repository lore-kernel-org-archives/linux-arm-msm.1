Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702333;
	b=NZd9ORKqNyIB0FdgePOrC50320FCByqB76Lk+oIedmnvfw0R+aIuk91B+nBbZLxOX3Ul
	 J0a9ksr2+jCh4/dzUeZBcQZIDMzIXW2PAYASEFO0Xl+H3TjdlaUDmxwxJdLSHn5c4ci85
	 smUcacj5pjSK4gc+JI6ehZR/Yb8+OmzJp3REa7dT344i01MOGuZitcq5sqJeobSLfDQdZ
	 EIYBrOzyhNcdGXYjor6pnPhYeQ4nCKNkKWSsuJF+TuSbt0r9+srk/2LF/4XGD6VLpDarX
	 YRuraWOqp1XseNFCc8kc2VXvxF2FRlsDM5MXPbBxUnj78Cj/JSUD6ynr8GKnOcdV3Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
	b=Mb5B4nHBca1ih4NUnLLZvXJ/uLuOxKN72/cMkKzLJwPInBKB7Wm+JHiuH5BqChdbNEcB
	 Ou/F+Zq6zvT+xDflMUkd/5r823jYCrRERebdFdi5NUZ/g8s9BGdas+SMhbujQkL4CSD8I
	 yeEAIVYLOd8ctIwS80HKaTeXazdQo8dwX2Z3pfhMwHKoioVmREIJe6tKQ7NLGRNn2cxwg
	 ZY6i68hm778P3TOGS3+z2VubgG+G7lTKlpxKwR9Pscxbm0K/e7C4g17a6L3Rv+PiDm9cg
	 vKFZEXhkbHjwUYxWJTVTDKWgohpHPxcw/hVceQeAlvxazDPJIg+GtV9gkEt3zt6KiuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUxIfvFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY8Dy8Dj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021BA606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021BA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUxIfvFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GY8Dy8Dj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQw22785104
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=; b=CUxIfvFk9k5u6z6R
	dHV9V1FZe02GWgcAY/NmHXhWQ2/3sIDv1dgDpw2F2GGxsmrRS6ijKWloR/I2Ud1G
	Uvgq0OXIKsVN1WCzcJz++CubteZBPLV6i/51Qlg2/hnQv7v1KlhzbpZrAsc5YFwF
	ZNGHhd5oO1kdXJ2d5lX9nK7HEN+1eYViKcFBvuYmBuJTLOIjC+EcuSJXq1zHQeav
	wgA+oDWC2SGeXva1pCY3xLcyQPgA8tX2CPevuRR1BGnrTZS+WD6O12pvR+PvC6WB
	RuQWjk37fwHDW4EUfQXH4UWAQmuosgjYXzHjcIdtishLGE85+mXf47qa0v0R9bim
	vLBKog==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb82a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:12:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so2480317e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702331; x=1796307131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
        b=GY8Dy8DjQI8DrLEXNlGP4y09eou8ROS1m9+DCvtJITw2jtC/1vmfjWbRyuSpb+6M4p
         iXiu9m3FwxOPU3xyWSvEo3aVToFvUPdSITiKj7woPpaniDdfsVIfJb+L+pbVRaUju/xj
         IuUUqTk6HMfpuS3fMZZRcQW3tb8WuGXkcFFWiWyR/6yAqlW/4gdmlctzOIquVt/5UZqH
         zzQTyS8TnA30rXSVLHy6PTFL/RC6fRWxIycFBgVzKXFCGJd8EJsJc3Z7noVMz3TuUnT7
         w3gUrLTNXG9FZhll11a8nXR+EKVFujtr2uTiS983sSC3MhhcX3fnqa+hnF/xRtHYaaJa
         kYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702331; x=1796307131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaFBp9pKhs7Mg2Q2f2Pc1nsla6/NIGo5cfXT06UfSvU=;
        b=YTmw2+gL8hG3xL+VCv3RdZbKdNRHL7J/iRyS5NM8On6tYJPgDlMUrHLdNqTPikwELE
         XaOurRvqPgyYzebROqgTmQlB+ykWaYM3W/GMsPNevISGe44aYke4Ye6mPZI2EqFccGq8
         gBZNzvr44iw92YseoTiqzu0p3spX9pFAC683Gr3xShpife2uTmHaomXv75eBuvkoLMsI
         Vmd5lapHNP+BB7MjhPxTCiTRBkkVhDNeC/vCpSqbuR3YBtkYdAIyv0N4pWSyMsbBVdSm
         Pk/Qlru+1GkAYyO5rERDfzfLTK7mZZQBF/fCx1L4VKcEQAIJws6B6XfpoxOCD32N/+SI
         R4Yw==
X-Forwarded-Encrypted: i=1; AL+hErHo+N33HCOSbekXqYa9Frhp+zr+uRI5iieKntZiiExGug3SRuzbIhVlqxEwx0nMQ9NioFBenweU8o0o7MW2@vger.kernel.org
X-Gm-Message-State: APuU4Z/3MTGiqJXIRUAcJ+kW9rxrpaDLc4yHWSPiCxnsRdwwXjs3iBoH
	uxKv5UjCq9f9LEkY62IC2OZ/eb5CBxyPoTmN7DFjESXpdpy4ii0jlpr5il+e8Jb+ocLoEuITcF0
	6NLUFBWFMEqld0J7ohVk3Mj8sxu2v0EcRPNvLnfgSiwE8u+qklDd7o38VlFcpVF/c/4OG
X-Gm-Gg: AZFdTZe9MuYLtzWg6nTfmFkfIrwWrOBulH/JYRf0C36DvMf199rjABD0xAHwyj1BdM5
	W8fM+qfXUu99SPAgVVHJH9wToOTK5W3IxwkV+YFiswlyABUQpcA5QmJVwrapJj7NxsFT8jOMiI3
	0LDdyXdYYzkj8aDmgKIyVfBitZndXV8qSkeNPjz5xgG+fIJWJjFEa76Dm177b3MEqHBSwivpAQ9
	Xp4cKgU+58/2xCm6kT8/ejsZYzGzFLGoPE0mvoJHZN3llDjKoYHHQXk/kLnuLUQzYhzt7hikou3
	mRF/5Z9VXlRqeybIsIn80nlDle3jksscb9cMiyt8DIY6Wu5tpbUHn5azyg8AtyvMVu99zaUaul9
	gQpBuwgbga+jqldueHuD8rR7LwvtF+lf1cUYHhkfN306ov6Ob10QAZLCuOCSoL6B8PXjZmlE8r3
	7DEdCqtea6NBm8UbL2GaQdZQvsGhX19ddMH69kQSXr0dBQFynUIAhudm9C0emhjA==
X-Received: by 2002:a05:6122:1d0f:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee8af45319mr13834042e0c.18.1795702331109;
        Thu, 26 Nov 2026 06:12:11 -0800 (PST)
X-Received: by 2002:a05:6122:1d0f:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee8af45319mr13833997e0c.18.1795702330684;
        Thu, 26 Nov 2026 06:12:10 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm583807675e9.8.2026.11.26.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:12:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:12:07 +0100
Message-ID: <179570231658.22277.5231642752159310607.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-Proofpoint-ORIG-GUID: bmacGE0s4OWOFCymVU-iL243EQD_sWg5
X-Proofpoint-GUID: bmacGE0s4OWOFCymVU-iL243EQD_sWg5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX3z8Pz+Qj0bOO
 MmgwEzU4o8Olt78Jdf3UDTRE81YEHOLF/Fbwz4lK503pVEsJcGOExAP3KV4SQTfCyjAhRn0Kc9A
 k7EV3lyBMzC3iqkklIjjGLAL7U3mgIs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX33N6XHTQ1WGT
 MXkMccw2TWWwDR932LaKLs4WS/8rXEJ2YF8mesdbnmQRW7SvGAM9W+y1h+9q7qzTg/Ipy/7KV1d
 LKZ08Mi9hDAX8qIOTcQGQnk1mbO7NAILVNbUOk6eiUOgfgSIkZiQIz8Bck4veRhV/oFkNIBkCqk
 wd2SippsQggET6YhL4zSmA+cOzkbfIWIiMS+ogxM9ESoKlE8t6sab58cqb0pOUNwdKlzGuhVr/r
 Ypkh/au0lDWFZbovoC14lySqN3avBI9yVarmS8Za2TB5BiLFCTP2oifzzXvlOQVx8c5Tf2pt2AM
 AqFPKOIwICKRAoZIG/Hmuw9415a6gRf/imQVJ+Kfb9wJxk8fcaxxVwVwSpYL4iqvpAETq90eukv
 24STDPMDz0w5QdGp+sqiwhXvLtH66lcmAcIHTrVAPa/oyGuE8dwxWt9ZFY/kN2CtjLAZtXqaTEB
 OfXTcHTjDv8x55oPNuQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083e3b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IckF0Qp3E-YNKf1sYy4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Tue, 24 Nov 2026 15:29:16 +0000, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      https://git.kernel.org/brgl/c/c6c2fea2238e232740243d09e2d397221f5c622f
[2/2] pinctrl: qcom: Add Halliday pinctrl driver
      https://git.kernel.org/brgl/c/aaea5cc6735dc7744aff4cc02ea5b6db9db05c17

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
