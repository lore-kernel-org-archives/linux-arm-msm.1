Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088237;
	b=zEW8nVbSz5R1Rez2AzoupMBhTCzcBc74b8o34BGE9jZgXcnZ8Ln6HYc9X4vl6rGKEWvd
	 UKxNs72z4MlTZuwQuiixdFVf42KbAwL7KhUEvNcQAkfLujjpLVjHHHpkLXmHitJCWxMP8
	 /smwEdQCgq42y5wECZowc5NaadcWLwmWAkwieCMiBg3kt7C+qQQ/m6DnBdaHUYJDD+c8r
	 ZzqXoBibyuJuovVJF6aZgCnaoYXMRK3wxyy8m8Wtv9JWiWFlcETb2DreweHKoRr2aEgu+
	 cenqSZopd45qfrlzahafUdbPnQcwldFz0xGksFdUeUO6jjX8iDNo6GYG2x3KgaPIFyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
	b=DIwIixlCYM+5A4aFgGgtebFP+9nOIQyn9kM4vRKRR7dx/kPYie7z8AZxiV84e3dUtDSm
	 ggRm4HumeySWBXABMi0CAugXf5AFI066MpA+UP2JGwot5zI/cZvnVG3/BgWpDGJ/EI3sl
	 FmbElQAY9yhKbhQcun0aeaZLLHoJRS0y450EzP1x/K/KEvVA12d91lWo8tOXV1XHSa3zr
	 R/fmVYh0gHOLxK/nH1Gy4Tkcdp7cKMw+lL4NAOqs8Gd2V1leZP2kLDUvqFFWzTokX+s9e
	 O853XnZ7m65kod2HilI50eF+L1PmyR3g+lgTSlWCcMqpLfNcMTVyadwpqUJyhZxgBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grtmjwtd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi6fAnnf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7B4606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7B4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Grtmjwtd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gi6fAnnf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuVtW2110934
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=; b=Grtmjwtd2WrqGcHr
	Cg84k1x+8W6B2qV1BAxheZJdkVwmTYlw2TjCmToqVc5elmng8tDROjGiz+Gc9Q1X
	Yy2+imaF1q323teMmCXEqkVV9LPsgJhHToJIgPDRH7sMFyHcuBtkX58CZw85zhub
	b9dQ9nL/StXJ5kEIcZwfgzBPtkup1GvFW+IgC0d32pQwsOPvjD+EVQuODVMUMumQ
	qLdCzwD2VQRAXciHy1JC4e70lUCPoIsHArpgWykjdBBlrn7T+ZQAVrhCq8iKXMEr
	asHfAQGanxarmAAg6W9XzLKnNbpxh4MMCS200wZ0iYNjTVNqHaoD13SX22caAwYa
	TiSvsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9b1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:37:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1602189a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088235; x=1795693035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
        b=gi6fAnnf+G51wYczPOqqwI+BycEfpKwczHXT/sBFBaavybMPy6hS+V5x3AXYYegkRA
         KtZEXj0DDiRN+F+8gL6e9HrIywqWuOUJwgOXGIeXTf13ssyQKo0i/2NC1xk4QsFNkZbB
         Y4ws8vkWb+b2aBicFGhUZfiQBLOKRR7cS3No63wwR/uFprcXcqzjScNPeygxObgPH4tx
         CC+xN2abq1baeIEg+BNQfMnKaOFHD4KlJo10cTUAhh7zGDNkZALbBMCNceYHzXSJLvpo
         IvtW+hCofUJwkza88DIE936VwYBCXo2M4juJQy+6BGU9ea0qKi/hxrJOFKKlUEmkQkG+
         kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088235; x=1795693035;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjzyiYZZfDIc0gpEuG+2pgrmPaO05j0+/+7VTnx2JRk=;
        b=V57WoaRORIlQlNyC+12qRzc+tY3fsrMZJ6lGpAUpf8U1l/9vNtVs8/CqChyvPqIeN7
         dK5wRF+l4KwawVW0+uf2ljd7GRdxG9IsTk5rF+3Mi5i/WqGVelpLdrVyOBeLYZ9QuRuo
         bvo/u2MA/TcPs6TVn3Vrp0fKarlh/OCJYy27KD96GDZilyFOPjcWeew32xaRzYwya5gX
         ivHSCQFpveUqs/1v2RZiHKOFu0h+397B7SdxF6diVkRgjy5srhzOCPSiKRJEXL0iGIk1
         n1bKaUhdclF8WcJj9dW9GlnLeQ7VcNJikzLGuWh5VqREq/FiTf62Dx05sbrHmtmTeQnk
         R+Kg==
X-Forwarded-Encrypted: i=1; AL+hErH/5y5SUX/iG5UXAk+Nv5LK/1HgMf6I/OmmbXnz33UxeeU1XCsEPSQiChC46YVvpBDetKtotav5tsPR9f7D@vger.kernel.org
X-Gm-Message-State: APuU4Z8csue2rj3J1U23rER0RShunz0l21fbSmw5o8/4BaxswHock/mG
	82ECJlpABcso9hEQxYOuu84Wof9XMrRZy4SUvljLdPaoOuR0kT9cgYQmo0KMgvLgIejc7ArQVWo
	IvjPvdlpRjEo3BTpnyodGLlxUqXzSSaMWfnTnZRYrX3NLZ8EyZpTR4fwVVrwvvsuWjTYR
X-Gm-Gg: AYBFou09Nvb+WC+rd2bJSfbt35fMyfYFP4Ys5VGUDsXOuw/YVlVlDqbPWB9Jerd9mKc
	ewzeQBxnpIlWtFsSXzeo29ScVoWNTceRrV1AakWdjhoobCNVh72CP86Pdp4tobPXRMVxqcdN4vv
	LdQDs8CbR/D9wctOWvnVKgp4q/8SfZLEA1yXB0FkezUZpL9badtqeaT5Usw8WFlX1vXg/ch+aPS
	s3/cR5/GZvy+bbHt1vfjQl7nYB1m3bdVFzdtcJ6CTl4o58X+O9TMqBrjCm/qY/ZhioWz+RYdj06
	zr0AO30Q8AvMGISHDshmmMQsVf0fQelL+jiKe6b8UP9VHjDqfGlgUA7xgZObXaybDBRsf2WT+Or
	/hWMmyJVhtiqWtGvwLpF9+ixQqz+m4ak4ikeSOzB8OVN7JsymuWoHR3qMe+1LIwsUcLpJPo4BGY
	yH+w==
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5801564637.47.1795088235182;
        Thu, 19 Nov 2026 03:37:15 -0800 (PST)
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5801537637.47.1795088234727;
        Thu, 19 Nov 2026 03:37:14 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534631b8sm1663844a12.7.2026.11.19.03.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 03:37:14 -0800 (PST)
Message-ID: <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:07:08 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n9lNFmTG36KMhXhjNNcuyIx00EQiFyHl
X-Proofpoint-GUID: n9lNFmTG36KMhXhjNNcuyIx00EQiFyHl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX9BoI6Mv0gnK+
 hi9hUK/srnyZVaWr05ze0ii8u7nCrfDT5+XOMNDGGDzdIWu1DHsN1niuFbIdAv+THapQsRcSM18
 9B6ghQHVoHufsnKF+g66EpvCrQuPBNs=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afedf6c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=RAPgPVZv-YkfXzKxjk0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXxPqzsvtguF1h
 npl/gjEkurSMsXK5OOPtN6wAqa8kYZIKLxVQSTvcI0O7Ne2+EwSxrxBGxEQPpj7w3k/JM3VuBBu
 47Zz7ZfF/V9UGeLLT37qCWbJhKxfKYo/5CSc+PN3aa9B4vAFCoQkci86SvizdFECMmh8G9Z7TG5
 HstryiDt+JqmzhYsUDpU3oc40YQdGjOMO6VwKJtG4FIAUu/r10JhYo1hfnUZ8LRNIpTPsak1RiI
 0dr1Lv7T3NAViZDbllUghwfjFjUCz9xSZvGk9Zx01JqG7RLh8uFbzfLfIHXdFBHWaE2eOlHe2HQ
 B+OGJ+ymW2P7GphEHbDa/Ag6xFLDczTXW2S5Ll/ncDtyNbKVs//c2f28ok0meElk9K7t+hi95D6
 c9/8IAACWmDTYdeHzjLjpYN3rp0pH2pKecgfkimPjnMw8rLVXHMHwoeEUiuCk5jzmb731pMJhKI
 3j5M2BbTBcdi4qX9MTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046



On 16-11-2026 18:02, Nihal Kumar Gupta wrote:
> On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>>> It was not used in-tree yet. 
>> That's different question. You added ABI and that ABI could have been
>> used. Was the ABI ever correct in the first place?
> The documented ABI was not correct: port@3 came from the old X1E80100
> resource-table mapping, not from the Glymur CAMSS port layout.

Hi Krzysztof ,

How would you prefer this ABI issue to be handled, or should I
send the next version incorporating Loic's comments?

-- 
Regards,
Nihal Kumar Gupta

