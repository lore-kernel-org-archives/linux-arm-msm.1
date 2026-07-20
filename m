Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C42C026C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537580; cv=none; b=VEWlR+cT6EapZt7hEwHznJr2h1SHygands6RJyB7YDwtyaGv4iBOK2JJFQ4iE4iNOHSYg00emOeLyZJiDw+QJRsQduqV4D5v7rhaxas19gO5x1jUwpLKefPYdFXe6j1gbOwrE423YOAyy9proDbS1VusVo/KC3yRrEor8tJH+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537580; c=relaxed/simple;
	bh=SsBzI/PD6qzLLNqrqd1osStr1DlivaZ6EJ8cNkglnZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAHaFC5GBDU6lTKC64En/nry7WuV3IXi0Y2LFWLak9pBzgtJEc5iBBd6EXa8blo946zHMEOGKDORvbxYha/93ZMIUuSJnPCjI0OYdA0lDtc6wtLciOAMhQcQhFNsyqNFtCKdPi7T+b+pyC9vUSv1+o6U8CKdZmob/9F3vxMXmpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QY1HXPW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZksJPQt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QY1HXPW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZksJPQt7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76vK81896145
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLBSggf9hSDqD6MIIH7JLc2/MxFtzpYYEFMoFUF35Wc=; b=QY1HXPW/GdX8ra4f
	Mmir30ZFzKlSQoS9yTRBLR04bMFxbaoxTLAZuKqwkjZ7INIQvswCvCe/UARyZWiw
	IHi3bOD1Ak4NHfLoyKUAwGHJeluRJbmsygXj5Kgy3qtFKxNk+mYl+tS4PTenWL8N
	Vh6cWJqZu+MIr3esD9DGGCQk7QDLgElQ00905GlOm+t9CgW5CXFww3TE0LUxC7vy
	aIXKpcS+fVfcP+3Sms8x5BrOXQb1YjdxNb0Vu9D9b5VSCogUkaxoXb/eVfn3u6xs
	7oLvJqAC5iJRzGtp7drMtRCS5HQVhSXnUTmZCQpl/W3kl+1Dmn+jxLivM9ncCVQa
	/q80gQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0krdjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:52:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so29452336d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537574; x=1785142374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLBSggf9hSDqD6MIIH7JLc2/MxFtzpYYEFMoFUF35Wc=;
        b=ZksJPQt7te4cTA4xvQsdeuA827BYlp4ErywyNDyJ2T6lXQoeupfSKH6JZBmFU0LrbK
         //WFWVBLyTVNXtoyGt68QBiEtaLk/xMLwb0A/ASeNjo5qX+2JiYVJb5gXrB0VybVG3X1
         ju/UKyTZalB4nngxjWHkimZWH5SNjwed07lgZV1xRcsIPWqRQaslYljYXEClF6qNNLco
         t6LE7lqrMBOk4eakppeGR4sHbCSVZB4902AAGY7TEe8wc0B8JqkDpw9i8FdhNcf2EmtF
         sdTM5DAyPnGurANJ3n1LAXURawl9OLr9cLS03cCup3ee/3fQPyXQJ1hAANxCtsNlyOJv
         y3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537574; x=1785142374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLBSggf9hSDqD6MIIH7JLc2/MxFtzpYYEFMoFUF35Wc=;
        b=ltEhHOPsqhFxptOANT1iLONKc8DcCUPe5wApB5oKEe7klnwUgO9LxzYIq9NJrYbB0s
         HhK17Nboh6+TZIFKIJVR0LO3c8s8HJCaO0x12G4/oePSMQJ9oz1ivHqZj88EVIR8supT
         Jql34w23KsmFhuXfSfUnTnhl2dxKU1zlB8zjHOgkczH+knGT7r57kkgBPEXDYqL0yAht
         RdQKWKkdVf36xD7vOZJ/uvEALhHBCRm+j65mPdgDtgXMxI6BHb0IX4KxQSlRW+3p4iaq
         yDRs8dH8N7mRVShn9FKNfI/vtFe3dDq8rxE5SKlwDVrJbixphcykGgRf2cpqw0elKkOi
         0cog==
X-Forwarded-Encrypted: i=1; AHgh+RoazCMWJuwFuvdmMjmyNxF7y/WWLsfTdKCKYr47DyHWlCa8w0/P+IKKKxGTmoyKwQbUpENFKjwPXFEhZ9IZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyxE5jRA05R/69W9MHGaTkc93v2PgELnYwUam26NAN4njnVaC+j
	D6p9wEKTlsML8d84dMIoJmm0NIcxqcX0P08SXkd2IECWdclgQgQUSR/+9ktkaeBDNqRr2DUpAXV
	FdkN2vbofbDAG8pqk6ZYYPPi+ETGlR+06NGEjca2U/p9H0MKw/KSSFNHfUOrgh6qLoX+k
X-Gm-Gg: AfdE7cmgKZhAhaQ8Sd7ZAckAgiMPivA4oAl8n67L7igAZpksCVQwssw4/G7nJVMI/oa
	I8eleHzDATon5e+QDChjfoDBeJgzrL1J149pnubpAxOjTPINp7FQ3qvPoX28C+b2W63fC0W+miS
	QLZ+Y9GX5TNhiZxJ84+ep9Uyj5BvOH29rjs9UaumUkGZ3GVGCpX7LLkD5LXTHdNoPCPyYP2yKS9
	MhKThjHibsozS+kJ2TkVXFsBFM8iSZI2NfU873/dz7gfhz7PIsld0j/Vr0nx6iJSws3eN94/8FO
	/nIyYyNOTBqOGrrV3yGLdtgNSNgq9OMZcdKMxTJxQB9XPQRN2lcBgznE9cjhbyK23Obh2Izpns3
	sNIEfNOD7mw/Y5ZBGey0lS1AE
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74188101cf.3.1784537574648;
        Mon, 20 Jul 2026 01:52:54 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74187961cf.3.1784537574237;
        Mon, 20 Jul 2026 01:52:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f986sm430075566b.40.2026.07.20.01.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:52:53 -0700 (PDT)
Message-ID: <2ab2db19-b193-475b-83c3-39436fe74a01@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:52:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7YCrcfm7PITB39LEi-9WlQZNy3UjMRbY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OCBTYWx0ZWRfXz5MijVK6h507
 AXHGlWESvmz6hqRhjUijiT/vriQX0v5x2eACuQn/gdx59kl3x9BdqwDJCEvdJd8B+xuf6RThEDN
 XvxBDuuc7+2H84Ip2INYl8Syxwoz3tM=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5de1e7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4_LmeBUvQ-T7zM7h5YkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OCBTYWx0ZWRfXxYfZFf+8vUxG
 DK8Vru3nww1mVB0fe423jcgPTXBJG/OwkapEuZQlEp1V6rqRWFTS5TfzU5iA7UlhKWTGbwtruGZ
 sQoWiNgXSMsbq3RfYrgvN6XaR+hfiC4WVKcpYzaGT7CgtYdG5hPgTptsZty1iTlTBnNw+csaYjo
 d5936R5NdVadqAUbfVFiR/thA5whJW95NIyxFrZZBFqtfdqGjsPGcFmzk5xf7EUdMa3szRpRKt6
 Zyqr5g83af6PPRqqeO+CHw4/GG9MfgKjjLtk4RGTl/eq5RIiANLABYqNP9HYLSfn6nT2sFSPZak
 I/hD+aqRUSIacm/yNs7K9HXiWhjDShapi7W9WaJ3d95Ogg+qMQxSlUR0GTyMUcwO8GCgoKDETFB
 Y8ZHwmdVemArU9Y40+2jVX4GG5GYHGF6RZFNzQzgFq1Rbn5pKrTQZHNC20pOH/7inUt1CdO9kJU
 qRrf1UeYGPM7M90e2ug==
X-Proofpoint-GUID: 7YCrcfm7PITB39LEi-9WlQZNy3UjMRbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200098

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
> efivars.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
