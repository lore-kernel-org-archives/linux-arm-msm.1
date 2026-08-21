Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292A4476CE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307629; cv=none; b=aR2DmtMlD1RLW0N5u5vH/6SqT3Ijq+ppRYExXJhgqDASh/dNKlZtQy9r1goWknJdS+S2wQPd9NWkKwjHfhe+JDPXkRwDWRwfiS4CIwdunEAteZRYAlnpQgquNIGFw9uMRPbUxdzxXk3ozpATzPTYv/buf8thZJ9s8vTw6ZsRx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307629; c=relaxed/simple;
	bh=PMeE43Mdrrjh8UcRe7YrT4AgjlD/++/Cw3jiJtrRBiI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=cGlXfDWCPeyHXV0mxA41YFOx6d3ygbjThV9i2RliADvhR8uqksrWM7s1cXUWnjqxQ6kiwZLrMdkdCAQimfn2goAacTkqooURJrx8hxf3QhX66X6O3Hxrta2PB8KDQNeVyxwXKqX5LIkYDswk4YyOAxYpOPkbCQKi3wLTtLqRIlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejrvHSZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPmWHeK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejrvHSZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPmWHeK5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LwIH1550421
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HGqBj0EhThtGDFFwWMAQyL
	udl9Jjy51THqToJ4y1ElQ=; b=ejrvHSZxm7Fz8MWzdnpFojtY3Jwh38bfJEgq+C
	OWYv75Blx4SpyZJPcjzfEtWaMTrzYW6DrHDhpeOCZ669x2Mzso+FWPHJPbQ9ixhs
	YNPsg3/vdD9CiZd0RqOMIMgj/hwP211s65YGmEsuEGXl3mE2QHEqko3G6nWs2INA
	rjQ+D2+DawXLSQnJTYWubQswtzdNE/KYGAhG1eEE7wNVAhClP2wrEZmUicBgDVSi
	wsWvsbQkYYJhNBss6rIIApW5/JJbclISIJIlZ1pARziNeHpp8veC2iMR12H/nNa/
	SmUnTEm1z5EC95IZHjEFkQJ9C4bfMelnw7MyO/5Z5sqGJsDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d069qr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:20:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d5d00fd19bso16641125ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787307618; x=1787912418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HGqBj0EhThtGDFFwWMAQyLudl9Jjy51THqToJ4y1ElQ=;
        b=UPmWHeK5PkguehexiG50fcQqwMEqEqX2ihrG7v1bhaPQ++zTgUnbqJ6Hbj6s8C8wG9
         jJlCXRnyxSfyvYl3AFoDPG3Qg2vYcTXkGCo8+ocnq4dZB9uY207VTWxWzSvR+77Ss1A/
         pT4Q5ryOZlrMEYNVPvzi7hBpHoqMEveaibT+qOksVOCpa65XurLOuQ+4bh/VVG2u9KJx
         393s+bc2ZIThb04CKdPulR3u0JVvk2awcnOwnNaZb2dBUA16yfeABlpwz3XoLJoWsv2P
         gMGAPyXFRP5vZwUJ680jZPCFYoGODWmgbEaLJdiuwW7nvO3S56Cy0WN3LSZ5lG2Oe9y9
         ef3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307618; x=1787912418;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGqBj0EhThtGDFFwWMAQyLudl9Jjy51THqToJ4y1ElQ=;
        b=lI9/eq6xuuLZAMP4NRFBSA6O+DWruZwGpkL+UAMUI1tfRTTBJJuhGFCjH2poFelGY6
         CMeOnldTZypMSEUna+R9PujpYOQ9VJWapNP1SeYyAUSFvk3zvLrzEL+n21H/iVto/dwc
         ZAGGFaab1GCbBzc5lV1qdonH8EcUIdDIpL994h5hPoKQhRB+OxF12pBJeHh3EfRzvdI4
         Jwu1eLU2UgdJ437+FlaXj0y+SrWgPEWB4QAJ9a4eOzvjCqDikEdB7w6fHux4kd+xf8CQ
         hcTfElM14NqJ0a7BNdg/bj5mKgWHqCu1Balw8UDJzA4TFtM1CC5HP1Dn7QyRLjhJpklm
         7HUg==
X-Forwarded-Encrypted: i=1; AHgh+Rqkp7ljWK3GKzi5suy7onSyxJlR6kdCNY/WdAzQfmKqGWzoJRdN/2K/LimMeOHQ2OJ8Qn/5+yFlW2Rqps96@vger.kernel.org
X-Gm-Message-State: AFuF++kiZ5gYLj/9BylbfpslvL9YAdu1yv0U8/i0BVOQzqjP3V4pVjdy
	e/LXvJL5I7VrswFOP8VoRbZ7cpvuj9VeTd7av8uRjcK10XWp8R/8JMdmHDD+fb9HCoq6el7miSO
	x3jb1rT/DUxDNF4E1Cl/0GHQ0ggjm5UGhwRI8IdHTBGAZ68wRg17h8i/15nRm+8djT+BnJ8+dnN
	7E
X-Gm-Gg: AR+sD11FDUHBTF6iSRsS+111N4Sdst/TtCtQddTt1xGXqAstHHU+HDv/tu21qEruBeY
	iFkLXxcMLq2XiDF5DS4fy8/ezNRUZ0okbbKXEPgiGYdkvIKATF1xiuRZgNviTgNzsuUNSpWDGOS
	AGtiqwaDGSGuXEeonoWFHjyhiTwB278S9+UXJmTdKgMb9pLmhKHFldwF9V4SU9fscJCBONYb9cV
	ovZCJjQxELCGMMCdBv3fQ23JI8slIvV95SSSmOtE9lVPjYZA2DQ1O/mONXZByYfyJqqg9qjb+le
	3kFCsXr+d3ddKo8nYQNHqGGOPiXj5S25crghvgiugffh/+B59XD9VfMkITTl3kS6PuYsKNzOxmW
	OOKweBqumSYptwrvYRSijNGo5rWmV
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr105051635ad.5.1787307618056;
        Fri, 21 Aug 2026 03:20:18 -0700 (PDT)
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr105050785ad.5.1787307617602;
        Fri, 21 Aug 2026 03:20:17 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3d27basm16710615ad.79.2026.08.21.03.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:20:17 -0700 (PDT)
Message-ID: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:50:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: NSP Images upstream for Nord Platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX9h2DVFtPUZGP
 yKWjo5pkbFc6a4kuPZljk2Bv0n8817frY7X20y4ml1L3ZlAW6kqoJxhsZ0yJ4K9HEPOVoqH69Nf
 ZXby45YBjtbUzq35HQd9MBwRUc3k6wXe5LaZFgFYc4aVbUpmdKuHcM85aNQg4zmMLmEIFAXxUth
 HjvyAzNh3/ALeJFN31qt6Cd9io0PNUHfiIsNOQG7l20/bqjK7PBUw2AFno13xZIsSrERTEg+9Na
 UO/2J824Og6v8wtGlRuY8HJQulvAXTa8StWLfu/0YXTi6lQ4chGMdVVItUuf2CktKxNxMttDGXC
 rrAFiB2jbX7YRPEk9fWEToYiIQWS4+pcSO9ZLOVB8Y2R5vwpTBBIJcMMzysf+IOuyrW0DWji48y
 Uo0LisCkuDxVM36gJtrtCds4RQP1jraIlzsD5UoW/8nlmbQi2oIW+PCIvnprxhHcnA3ogJnniWA
 GM6amMp/3LNtZZIpznw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX/128omG2mU/Y
 ORvsCULJAMPQYjVigDc3In/ub6cqwTBcp9xv+he9Jrqc0e6DRskRmsgaA/xB82XXQ2DxJ91aHdk
 XKwXU/OmHgPizz9s77vDer5MwPZDDq4=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a882662 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UnnT8fP4kmW7vSwOaYsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: iG9H1Ru58oX2N2ZF6R4lxfQcS8j8NEKi
X-Proofpoint-GUID: iG9H1Ru58oX2N2ZF6R4lxfQcS8j8NEKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210076

Hi,

We are currently planning to upstream the NSP firmware for the Nord 
platform. The platform contains four NSPs, and a single NSP firmware 
binary is built that can be used across all of them. However, the 
current SSL validation mechanism requires a unique SWID to authenticate 
firmware loading on each NSP. As a result, four copies of the same 
firmware image are generated during the build process, with each copy 
undergoing a signing step to embed the corresponding SWID information.

This approach is consistent with the methodology followed in the earlier 
Nord program where firmware was successfully delivered. The same 
reference image is used for both QLI and upstream releases.

We attempted to upstream all four NSP firmware images; however, the 
submission was rejected on the basis that the images are identical. 
While the underlying firmware content is the same, each image contains a 
distinct SWID and therefore does not represent a binary-identical copy. 
These uniquely signed images are required to ensure successful 
authentication and loading on their respective NSPs. This requirement 
arises from the current SSL authentication implementation governing 
firmware loading.

Several proposals have been discussed regarding potential enhancements 
to the SSL authentication process. The SSL team has evaluated these 
suggestions and is currently assessing available options. However, any 
viable solution would require significant design changes, along with the 
associated development effort and validation time.

In the interim, we request approval to upstream all four NSP firmware 
images. Although the images differ only in their embedded signatures 
(SWIDs), each is necessary for proper deployment and operation. Allowing 
these images to be upstreamed would help avoid blocking progress on the 
Nord project while a longer-term solution is being evaluated.

Regards,
Venkata Kasinath Kota
