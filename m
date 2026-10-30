Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379357;
	b=Y1nLieP1ORHH5oc/hvv2giEVTBy+df7wX8VzU56wANcJXoRKkbYhH0vV/tJeC1ecxbXE
	 Mtbj9IF654qEniuObcZtLGHOsQRzoltGXM9iA8gXqRNlyDo9AqMKxSw6fmfOE1wlfuFz+
	 xAppd4nQKhzvwo+r7YKJJfY2isTu1ClAHhL3vNuYW/meJN1qPuG+Gy08BmWLj+qFKu0UW
	 XqyXf+mozEcuUa919qvtc+lfDFx/gYj1vl3Psz8nlQxdGuBCYEzqoRhvl4+NRHPs16mP0
	 hxXJLO0A4P6TSIjP/uabaoLWVnHlPfhgQUPXKL3GczGXOUJZ3HszAtQ6BLguH0gQqAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
	b=GX9D6R3seRw5IE4K3J+GJ1OFqGrznHPrHNYuUOkdIJlI49JWitbFLT6uKpL/Zyn2CtAX
	 a6pyW/slO+YkNi55nQEuZ9GIVbDp8RuiJ2GSZbquu4BONc+JJE4cIdg96vWEwTJmjpPOt
	 KfX2qyPEmrO7qHCBv5y4HhuUuaPyp1IHvGbSpwDDT3MD8/19i18HKMZuLEZd3LHSsJqm1
	 FlfM1DdrG1KzcbJ4UghydMAhPa/M8Vgm8/wCukjxhuW38xqb6P8i5QJm/uZUVVRgkjxTA
	 iB7XNly0IkO1b7Yzn17ho7EiomN0TFskPKviWAYnZFLVQ+/eUbT8K0bgStbXBJG6tAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94747606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94747606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERD1e2494773
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=; b=pcKpA1QBUxKqAvAF
	4lK/xm6iCV9fsyY7HjvxQF79U27otjHQSDOsk8I6TBHx1rzXcSG6P6Sk1o3dVMv6
	iwS/xrcqK4vAylsQhKPjBB8PtH1Oi2T3Rco69SOIUBrDxgrPfgOnvcfnIfI7nQq7
	GGUcOA0EeKPoFs9gFW+t7pvkgPjK60RuQ3en/uoLj4biuV2wM4qcptDvFsaIkFGU
	cFb79XfkkHmVJ2M70Gvo68H3Vnm2kOf85EnQx9bbj3xz3d/jYIMUxr/380L9ZHgK
	e8pg8KHvQvVK4xkCIagbk73vhl/qq5Hz1YNu0ZvMii0ep9L3WdtuJxjKeNsBYsud
	NZGOhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p44tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so7408125ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793379354; x=1793984154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=VUwJzgz2U8V9XOm4OUCG4W1Vr8jg0ULn4wyI4l7bmpqINQH0rKREEvMArV5gjRVziv
         LuLcQOQMmgPyhkLIKB+AkP1DCSwMIkI8MK0jRtNTvYPsJK9XWW2JQfnJKD6Sasck5iZD
         8H9VCqNNeEYFmpYZzLAFVAY2FtnZympio7pzrPIlFJKMmpQKoEPYsXdoVRYgkW/lB4Ej
         vDZJd2zvEpESjf5Kravzsw6sImea7NLDCwLRra5Wx+XUO9u/Py2AGSBd9BZ3f9vQQj90
         J+Bco3znVkORM6zGk6xp2nKKRRXUgqqlQ88u5v4fNMSX2hrtGz9edx3ZRb6VgYQfNQbT
         0+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379354; x=1793984154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=ji+DbOgXbW/mfK0EUnrVpHLfqS7jhvNbVAI/CDGmf+L6mg1XhndVeODKd1u1UoNUyG
         /YrrUoCMH9ymY05bKDQGMkOjw5XQi6or+EhsYQgQKHsywmkOS4liD2NjaGsc3x3maA6L
         xL3pH6Huq+qoMtVr5KjrWIWGoHZEQ8k7DhWY+jhNigqYocNIjyUek0ZL556ewgJLXP6c
         W5KtEW2pqDD98o5eCUb6KvynAg3dBL6g3UQzHbL9dzr5ahYNJr+HHmW02uT5qWBhmrWe
         fIGlyRpY06umij9a7mW+Bv5SoExkWk2jjMKon7VdwI5oUagu8fQ3E+KZ1wX69YvL78Q1
         qOQw==
X-Forwarded-Encrypted: i=1; AKwUvByqxEbtUGUX0znFoqzX6vNhfYKMSNJ7kQAba7cD7UVWvDH92pl8GIbf2XeadNfnnmCbcpbRJw7XPUPlRC3X@vger.kernel.org
X-Gm-Message-State: AFq9FYLd4/dNCDbhtWb+3n1Zz6UItOG3LqdYsqXQbZkPt1vwpsl9EEyg
	o+31DT9YqWYDh3tHJljmeetfAaAzNdVxpTYdtFwSGOPOK+IYYDElGDxJ0Xp4pTR0vcJ8M+xF1gF
	Sce8M6LiQj/ChsJoCqMICGZ0hKUdnoBv5VyTsSeSTucHcfL417eXg1SClS/dipTbveXik
X-Gm-Gg: AYBFou3piKOAF7LH/Vxz5j+PlooGKPJzyMEE/dhkbZHhxLt7RmLf1g3wFvtAXc/oHHF
	HLuca6z6xo79TaVkFtJDWb/tdHxVtD9tfsJ+V2g7xGVDZdozwLUxEcn60IkwJ7h2lbqXZWWMfgC
	VrVGR20O12TXMf2kt6dXNPbBajpCFG4nHa4AtBXHN+DSVIhg1ih4cagJ6VhNcPh/kq9Y2R2ZT3B
	wIvt7VtsjUv1Zj+fe/ata3Xf1bhKSp4rMHNR4XDoiogpgRRKURmVjovXRJ7uRPnI8OH0OM1YJ0/
	Xg8U8hmlIr0p6+agMiEn2hchWvkkQjNAfl96M7zBuEN8fO9ddd+rLmcS70RcNtxgz4Jf1KEwfJO
	iICr/aZy4faozvN8ghT7y1TOckKr5WqYss5abL2jiqnkppcWkCjIh15LORNCFRDjiM6g5G5u/Ll
	aO
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511737a91.4.1793379354259;
        Fri, 30 Oct 2026 09:55:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511714a91.4.1793379353761;
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096d3844sm1087439a12.11.2026.10.30.09.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Message-ID: <8e78ac53-4dbe-4684-8f3f-00f841c60972@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:25:41 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX8TRilnVWv1yo
 Q3SJCdtzXbn/XnpnBSalqXK6MoFdTJe3+QbD6eOyGCTw6iPcTRQl4Pbn3zkIYUuJGaXHRnQo6dM
 PDtFiMIQ99hnQPCabKkVUp3WefWvkcmwz+Z2DjlwyZTizuRBMxJAhGsCnCc9SKeNktA/0UrkW9a
 mPb7fj25yZMlqnlH0JDKcmT9hn4HEmxeFDb+wblDwrHheepJ5C07XWpbyl6RVewFyvBHC1v0JIA
 +X0HEzaY1YrEzT16Yn43pT0mKzrtmMcRrS7+MLXHj/Hx55pdgLlSzZ3OjrOt9QvE2V8SfvVU7zz
 UMC5MDCVaEZ/xDyrlybdt6Tk0D9+2zquin/EbVDggtySRKBMHiRcEohn6c50ioHC8dLOYkcfzAT
 I6O5DI2uNMu1tfoG1kCDTPhkYmf2BCaxvVZgwaKEJ5EpcDd3qpH7ka+bFqHPrIcWrdnCVi3aQCo
 nEVcT8FMWk1huXP/COw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfXzXn69YMpp/VG
 FOB5pPkGR0DmTfdF5NRhEEE/DLDkTqoycAXxpNxVLGhLHUZgK3dKDpMQik/oVnyKc+QvpHhrPR+
 cjVTmluIbFb2m1KHVFT6KAixZFOVn7g=
X-Proofpoint-ORIG-GUID: gA2Jtnl057C45yh1wdzQIf8ZfQcpXCxy
X-Proofpoint-GUID: gA2Jtnl057C45yh1wdzQIf8ZfQcpXCxy
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4cc1b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WYfwUfNkXDalausCwDwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300067



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Kaanapali MTP
-- 
Regards,
Nihal Kumar Gupta

