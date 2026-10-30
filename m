Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349360;
	b=G4IV+mc2tIHVDt4+FD84cyhNmNBc4agHgwjX+8KLtGFlPbIkxrpTN7iVK44gNe1uWTr3
	 el47eVRTRWN5tzJvRktv3b1+RZi0uma1qTGHalzQsgKna2vnss/IAALwxjqHCczhkLdp4
	 HHwvrKsELBq2sTvfWIZ9Xqbs/zA5YpCyktUBMpWXK17v+Jmf6St+eIKaOQO4DWXEYwMOu
	 aAobrNWsPgto0HEJGCa7v1OTxOorEYeo5z6YiK5aF/AfpSOvJ+hctbjhEf5jMSzbvpF0f
	 VByfIiWnWyR9FiCtwHmOGIOKFU7s6U3KTtWRCQdnQwvI215LjWAXs2SqFH1ED5SUWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=;
	b=GKUMQVbOTFuaVSstco935gkgw5/h7V0RuUHWhwsAoZeWKD10AeCDWHhbPK/N6ONyZX2g
	 f5dSJGO563q7oF/QitZtN8NPlWe0J4bpzLYdJQ99/41ycV/nOmLz6PWsru7zUdjkrLf0W
	 oei2beerBAvUtYueHrpArvy4rLE32ZUAgmQv6lwIRAy9DBgywUwpKeXT3qFTObjhYdEeQ
	 m98PulOiwkJJUACsvZ5HVO3dwar8fpitlFX4kMSkMFuyYtDZMrzQEyvViEF8ix341EpRh
	 9oPiwfd2f2+POS7yUISBSmF/07keW5+bPYRFA8U4iyWILY8K6HNvQHyufYCofC2irFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH7riAKZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4epssvy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0732160A260B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0732160A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MH7riAKZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4epssvy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9rf2374161
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=; b=MH7riAKZSiGO2jEj
	XWVxCXJWjvOyDK46m8K/q/ILwUqX9k6gFaLTogXB/2J8GB79vCfCdnesV59nhls9
	L9MrX8TwCcYGAWDMrRXRsrgUfOwHKeWZmyRLd1Aj6JLLzVKD6r2FEMnQdiOpiCu7
	vYTQRXh5WHeDpg0AYvMZM0PVeyb/YKAE2EFzohUHHmLqpGZpYW+xj2WNsZElYPLG
	h/fthvX3S0HPUPOpNSdJJwT3Yyz+ULZaz61AHXj+u6HBZjnDm1ZdhhYCHQ55QoZv
	QB3BjlYVJQo5Q6nAmiL2N9lDmngunpWR+Gl1zbaccZ2A2qdYXzyoZVSMfLX7NSC7
	ge7BHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:35:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so10120185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349358; x=1793954158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=;
        b=P4epssvyyzCR9tJiEHdnrxI3QZVRIjWS1ca+ICOewbnC7lr9AyP2KWRH1GEM7I33K2
         lsmG4Z8bIn/IDDWTLh72ZjAcn+fT0wLaIws7A+G0GSpii8fjRWvOa25Rg8lJj5bBjmce
         wTA/bQbjTmwgQCbj72fRXtKX5TucOrZ16HYqNLIAg8JT0DppO+HbcW6mrVmzf/UCNAiV
         yjMRXi+pGSm9sA6oFYipSXetlUPw/WnDcE37ZTjlhKgW9HBL/gf5yYiYeVH8AAs+wONf
         Pa+huOUVpX22s8CfOhyDxqD+vcW9ARvvvNQ0pPVlr9jbozGtEaib7cSBTp3mp5FrCag/
         YBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349358; x=1793954158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J7KmcYhp8MGRmEKR/ajQMu5IWDgP6+2nxjcEbK+xzU=;
        b=lZKw/2yYGxB/QILHN7JNHuNNSZSU9J2RpUALqeZ8eKF3VVQkK/viJSsEBIUU2gePI7
         35M3aPeAH1rvBH1rm+EajmNIRCIWASzfm1dnr0eOfK7XxrNitxwh1eSnq6eWvykcKosq
         2vQH0Uugyknt0kddo2g2XaDM4wK07n/MJL0G30r8x3r2HKyUKxxmJfvdR9mbyBD6egbK
         g0GAVLRHRjUoO5Becpvh8TuYACCBiIlkYHty28nc9sbttITPk4mvRGqCE3tDbghdwpDj
         6NWmW/t4VzOa01ZuiWS5CTF+POv9mnm9ayJDYTSbJxW6t8B8Bg0eEVTw0UCYwc8h8Iij
         POKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaooFah2ISXDxGppJhDS+/KhW1nd1FSLjx9fWmq3wYvniWXI/tO7K1YRnYUcvAWYrfEu9cRWzrA0r2aYBg@vger.kernel.org
X-Gm-Message-State: AFq9FYLqb+6L+Y9pb+I1KZbZ4cJ9dpaSJSnten0sC2MIVlM16Bntcw1j
	pbVwo8/jwqSSfrBMi5NWssssioYtImaXkoagG2OjUIweIaIW6QhNfr8nymhQBbN0P7astwjV4my
	Xhl4SxBF/WZeK0W2fzLzqPR1zpFUoaw7Moo25iCVuXpOt/n6imyNycFwnMye8ZJGZGdlw
X-Gm-Gg: AYBFou0D2ZyhN0Gl9ecEsD6LCpUYDWyeKgvBERLXLtA4igY82nlxf649ySvJjiXpTDG
	weuM5kWYw/4wobFvJhfoptHeGtEYjlP/Eur3Z3NSqO6ymuPZdbLAaMWnf+YM44yTSX2tisvgpMJ
	av8r+/pWQtn6FvjFZtp0msSwQF8fd+hlwdaN6xfTCmh8Rlr2CBxQS7RqyYcTKW8Wnp/teqLAJ+i
	9jrkQoAODCa/pgFYVnOYZrY2L49w4shRpqppaObWMNVwSVharTEp9KNKsBvc3e1z7NAAlXP5dIc
	VV1ApR/kEN5cgArO+5riOoQG8kL47HV9UVQ47vxKP4c2v3HgdH2o1QyUlDKgfACNWmjyCHnkErm
	O+UUowB8fq6Lz4SvrEzvjODQOeinwXGOv3fxmRA/e7z7iQ6XPJZyr0sFmnh0g4PhhOPWPYlo=
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr261457385a.5.1793349358178;
        Fri, 30 Oct 2026 01:35:58 -0700 (PDT)
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr261455385a.5.1793349357748;
        Fri, 30 Oct 2026 01:35:57 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f504sm39083766b.36.2026.10.30.01.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:35:56 -0700 (PDT)
Message-ID: <dc2c51b8-41cc-4abd-b52f-ef2072593d1e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:35:55 +0100
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
Subject: Re: [PATCH 2/2] iommu/msm: Use identity domain for GPU and display
To: Rob Clark <robin.clark@oss.qualcomm.com>, iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae456ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nPYanoZRiyYWTCGofB4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SYBlIOBF9JgXqpd95ttmi4hRvVokfcT6
X-Proofpoint-GUID: SYBlIOBF9JgXqpd95ttmi4hRvVokfcT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX/tCG31+oQ7HE
 wJ9PM0lBObnHv+uTYzrHvtmJQxzaqt+6xOMq9XZmPFM7YuESWV6c/SN82RdeD2N9IOwv0q28YgM
 Oyrmg6M2fLRig4MfWwhkTC3ZCXHtHaNX5fW8FREMEciIkbs/TGNcJfVmdQmI5EqyxIYKCEuEiHW
 7xHHm4s/BJzw4qraG5a3q2+pEZucaJW6tpRWv+YRjekiy1B/RgXikaf/qRHmAiqI08kBnwh4JdL
 X2vDlXXhMTUsfOkN05zKMnZHqpfm7TEaHNarWC8w36LX1jBrYDC64jcxcP0olZ/1IVhQUoeKRJl
 30W41s++IGDef+od3vniiDLvwqTFey6DLM0yjVwsJtUECPuDJHoVtWZXA41erX3zx3Ud0PhZ7im
 +RfrOeSmHuNsl0S/jjSLQPiHBGBESgQ6pY9kf8cUY0fdvY0iML3hWyeRXd12qZHZGwHYAguLEsE
 bDZjBHI6mBN8lwP6lGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX5WCOfhymRf+S
 NrtvVuf/1V7AneP42eGXz2tX9UHkqlO8fL1HOchTCwCZ3H4JrpMzZfiiSKDCjL91pGfTQQOuLjz
 LKrC4gXYmM3nm6916zKm2TlhdIwCJxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 10:23 PM, Rob Clark wrote:
> Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
> select direct mapping") for arm-smmu-qcom, match GPU and display compat
> strings to pick identity domain time.
> 
> The drm/msm driver attaches it's own domain, which it manages directly,
> so we don't want an iommu managed domain interfering.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
