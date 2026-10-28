Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193590;
	b=JZZhhwGDxTsWsPkuF22OVXD+Bdg0r6a5oq2hEK1ZNUnM2o3Dqv3gyF8ZXBjo7X21spnm
	 9H88wescpJ0A+nKlxKuvI3aUShDbXQfYxgL4uQCt6S3M5Bawcom/gyoLWRCDucNfvJdex
	 RtFbxPBoSBFRdJR2ZTStMtTV67cutYAovS/iIik9qQa8G7waDmErftcRQGl4CZM47nbN5
	 xcWbaK5DGzg7iFXHg77BS/5IYJ9kEKk0ghHccsk5/b0D4iZhC1dLerlKhm/tWD3c6t9WW
	 DccGrn2fC4ypo9egKv15CqUnZY53oYkUOe/tTHme7Z9GYhAMNaIom2gXdnlYePLMorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=;
	b=iASgu2q5P6cmmiNsHouxfRlSkGmY6uAK8doFhQoacvKQiBopJ97BSivbNp18FgPGvn0r
	 Yul515MpOB4WKwO6eJV5+Eny9kRB0oZUWS3nXzGkQrjbsr7xAsNBmlmZGfkRj+NjX6s7t
	 3uEow56otpbVJIF3cil0H5vfdXnUbMchmtIXeNhiZSpzExupChGGf7ieLXD8J1PdWIafx
	 VMPpuq4ym7U1Q+O86RURosOaFN7oiYL5laGWbvWTY6g4J/72L3wyGT6JhtHLvbAVw+tmM
	 eJjQIuMiT1kPpbcZhGGCF+Mi/JrT/ATYzSxi5X+4lBBpQvhXWxSBWly0rnLL4t+bt2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O2/qth21";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOhDeXsI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E5606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5E5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2/qth21;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOhDeXsI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI5xc718074
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=; b=O2/qth2162XS9tg8
	yVi/6rKuwKd2FIFBCePGsPMVpcDY3P3sWEiwA+Ug5KaZ116QAR7euW73XIwAzAXl
	tpSfWSaZ+7q0PnpY3atrgzpEMxeSM7D8ZQ5BNyQH1Q80UMatMuW70YOt3jZoa4ga
	vYNaYgWznGYSo3XkA9JOvaJMeuP+fCb7XbpCY/vJSTkdQVQho2m5emsuPXdpe4oU
	ulSU/qk9rdG/RcI9vmqgxhJaRo62g1SFvUNfig08mdUDvt7Y64Z3gXtPMGYzuxOo
	OOcV8qUS4KNNPAprA3gV20wNiCGfhFodsgJkqTTAXN89O4fhj1BLyzPEf8/qxYDS
	yvdTiA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjg09p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:19:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so72053e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193588; x=1793798388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=;
        b=DOhDeXsI0bW70Un5RJ9hSmWROGAM98Xn3999mReT3+q4xv3jDFjPaROxo8BybHmXP+
         RifAQDLHDQeIsqMPEllPta7EOvIDka774WNNmWZW6SvHpkBN5zf/XMLR0Fhv79BJR2ys
         RpklT+6MN/yU+ifEdbAJObwoCo71YJtwFE32p78eGYzgbSPuAWgTh7vksIrw2FEFSwuU
         2FrtaY7HMwZfdip+E0PAhXp6nPoE9z3sEieyfY8aBwszO6nRNU63sP4TJlIJRGUOfI0h
         dfyiquxLuWbDH+GssDhOKgRnHPVUKh/hEyLO+lUgOAij2uH9DQi0TL1HNPki2W8DIifF
         T8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193588; x=1793798388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sJ15fAiQ3xUbogZ/2lVO+4lcBVZ8XL9apblczjVX7A=;
        b=V5MIVhX4vhRumKkr8tZjO+Css7ABbVGYu/Y7SKNASKxYAtf7RB8DOzorLLh5Qway7y
         TkcId33lUF9Mz64TI/3ksw5oBV4M1heUcw1+P7BisF/651qG9serX0d/fecyTvNB1BaB
         kAI3wtzKTnv6bHSrEU67Z5gfoACiBBR1bMkTjIcda6kCXKd+mKXleXJR1v9392mllcKo
         9y7D+WVBplzaDPRjR7bFvsJZ8m0+2XaZs5+SnHPbQLI+jiN7e4qlkXxDjBeBmk9EjzW+
         xw30AKCaCmRO3r3eLzAh4EXqYCpFjIBgkfwZBT1zFMY+HeM/a7O7QKv+6ng83+JhwU/J
         9pSQ==
X-Gm-Message-State: AFq9FYKsjUGIMhRE9gFp5OBVI1mu5cBk8W8OxKwc+Yf3aIrn7/JHJQmc
	QNn3kM1EekumOR92Pgsbzc0HgNbodGaN3gh5Te4rCnOkGC0HydPypBcQ5h9cml+Sm0ABgho8WGG
	4Tz4luuqMUUOhzpq8fDgyk/dmhC++gV8gI/7LU0ovVNM0T3WoshgiwV++0XUnEu+slLpj
X-Gm-Gg: AYBFou2p1NzkE89ikBjiM8g+PoX24/vgY7srMp4N1UWyjbJ3/IVtY2QsjqLXMCjvWxH
	mWtKU3hypv1MIWG/yxfSPcD72X6sWIj8XCktbOOkOfsm5RLEYqV9N5/GwcJh8URPC6stPshjDjl
	xKTc7rTIlpyry31rKnToHdUxB2Mclht627vvXioLBDIb+diikcJVVZQpmVefRayKJKpbRkPgh0z
	EoedY7ayt2o9UWzyIksDaWSipFkd/qJ0V+5nYLlluH6RphVwyIEmEUT6eqlmbIFVlYYGWKj+Yio
	Cl70uEZD4ypJn/tZJWFPk+skpggi8Znp2zHOgKVzxgnzKhSDBhtZ13QooiALBBjKeGOTA3MddQf
	wWZXFaUmIYYIlCo3YgRWyhodlKBdxNi3saY7BdrXw2b3ae82RdlHC3CRNohIWNwz1tmeND0s=
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1273193e0c.0.1793193587913;
        Wed, 28 Oct 2026 06:19:47 -0700 (PDT)
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1273155e0c.0.1793193587397;
        Wed, 28 Oct 2026 06:19:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f3e6sm605557e87.9.2026.10.28.06.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:19:46 -0700 (PDT)
Message-ID: <e838e538-056f-45a2-b062-1da5fe4004c5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:19:44 +0100
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
Subject: Re: [PATCH v5 3/4] soc: qcom: smem: validate private item payloads
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-3-121257d490b5@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-port-smem-v5-3-121257d490b5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfXygcqdn/7lxtt
 A+eBET2T5r3m8YEj/kJuZSKs++839fngYwajEVR5PLZRvvsm/oeM6fiIxVGGTm0tnlILHWpP9er
 cft881MjksHeTHofo85DXfnnMXD/bGAc6Obw/odaIHBSjosJcjobbS7rHhP0Xt7ge1sXGja5e3S
 5vKfHUgPTC5TKF1fhubVBURW55wTBdlR6CBMxclp8dXI2CKOKmt57lTa/hn5C8f0JTAYSYb50RK
 zVWS9NllCGXcKEGMXm22Gz9hllW+rnmU+ve/NctePD2yYMlgsv4S91UWfrB5zTKGkQUlNqmv4Ad
 EyXf1k1q4uUS2N4I5bDNxyVrvn/WFFlYAv2fiQWH1+HVfBYwyuXP24DrKUMedWcWvPLghPm6dQJ
 kx3MS8fkoj9HIX+1YD5/KapVl6AzWOEQQIQhTWVO4GsBGsmPayrrGy/NCjPnRFHAEMWz9RVyxAu
 9Gs4+59c+tVlCXIkkmg==
X-Proofpoint-GUID: EEJ_Cieg_yltROGO_SGzUS_xsiv4j15L
X-Proofpoint-ORIG-GUID: EEJ_Cieg_yltROGO_SGzUS_xsiv4j15L
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae1f674 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=P6xoLi8rPFeUcLD7uVYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX2X32Ciki8VS4
 YVSqJkhhd2jPQOT6VJebEywqZYwJRQ+85B0K4YZKS0jFSylhWItPcNZ/d0T6GuX8oZ7hoowE0R/
 gLLyRtFR2hfykiqwPEfMqX+6TOh7894=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/28/26 10:33 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Validate a matching entry's size and padding even when the caller does
> not request the length, and check that the payload stays inside the
> same region as the header.
> 
> Zero-length payloads are now rejected as invalid.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
