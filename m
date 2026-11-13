Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591342;
	b=oNEV2rQ0wS8VrTnWp8Sj7foGspJChZRsBsHZp4DukY/nZZnSUIFqSP7pKcCmasy+nBf0
	 NNMeaTzdZWKuaP2Yf609RcgRLYR/ZAZWgwrtChSpdYpiqOq02TGANj5LAVqXOZ/yPLhiq
	 zARWXL+DQ2X0BzKuGBo49Pgc7vov/iIOrZrzPnQpuRr6wB0oE4cu2fucNQU2PFG9vtVfq
	 lux5qTiOSw/0iO26vyJHIzMZCL6tyQTrH19b5ikjByvR1o/9uicXr9OnjfoDtqmlhISJH
	 TVRsAbvVEY61DJ3qNRe54fXOO5avEGEwhiUeTq4GWHGLMmmWvb7k1C8oiw9ssOL4tTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aYZIOBn5BmRcgUyZSRiHsxOFf0KM9EFp+lSaex6vXAA=;
	b=mKIaDzQOIW8onRsrmnXIIu7VhTLEYg1Qde+k769aa3u4qchoyF0foTKIov15HnXsu13d
	 kvRbUCIMT8gt2L+WdwTGLv5n2kAs+asvJUlXArmWJatsWIXCF6GPL5qCFy84byEpFXGW2
	 sGiZgpJPgPNlinXO7FvkrbXpLRXolZpxYasFiE5uLPrF6iWCsRSwyjHp/OwpkYJfIZZZS
	 /2kCOmR+EvBzTYVeuus/f7ZBmaghgJKKf09AqDAM6ZJOp4AozWRo77uu6/cIEL6l4ogPh
	 4998Oh8w15fq+b+9SX4ij7MF3aHxRWeXKSIE6PQyT/aSIgtce/G5E1/11YaMOCjBCTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXsK1e5Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THX5U+8q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AB3606B216
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03AB3606B216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXsK1e5Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THX5U+8q
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR3Pd1076207
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYZIOBn5BmRcgUyZSRiHsxOFf0KM9EFp+lSaex6vXAA=; b=NXsK1e5YNhI/JbZK
	CAHAHL7xlq8nL4W/APJ7A5SnvbBkcKYS/pGl8lb56IAorACD5aTCnxZZzNboq8UE
	/089MYlFasj/cnv7idMAyr/smsU1IS8aoZomVMre4vicdrRc88azOkg0CxKlduAg
	cV3+MBL6ttp/rL8VFine6J2Axlv3l6RSfSFQVK9NcsdN2ZYPaqUry/Lh2v3DnzEN
	JKsvsLO/bG449YakWvxkm9jdNY7EPIneHVaJ4hbed5XtRKGOesFmISU3wwH9l3I4
	6JBmpwF3x3Q99SoyGRExnZhrpPYFGwnDpUKze9ZASWGpWycbFr7sN0TmNDSJ9BQ4
	Jc9j8Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0amukj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:35:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1229658eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794591340; x=1795196140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYZIOBn5BmRcgUyZSRiHsxOFf0KM9EFp+lSaex6vXAA=;
        b=THX5U+8qzqn+dKJfqNkqXhiIQhA3c58Qa4yP0qCQ1mAmR0Y2t4dpJLEXmMLnSavour
         yBTmOe9tSFgB7qcYzzvjfMPSaEYxV70s03eSq80pVeH20tZlsuC/K45mKAyq2oqq1tu+
         abXS8eINvLC4Rwoq3u/ag8e40NSGOSU8dZs1+PM3ESR9a0yymNDg7ku/nrNKz/ETXYvN
         TcfDENd41NZWHPJI8s1Fms/NLQdHky6MTWmXeJBBazQ6sBh5L4rh7LkB4ZBwKaR9bLjV
         rUHc6XajFY9eO9WHXp+E5+kpDLZWSX+U3b8ve5/YgCbVlwIsDWhHeMMhkdoPtyK/02vV
         peJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591340; x=1795196140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYZIOBn5BmRcgUyZSRiHsxOFf0KM9EFp+lSaex6vXAA=;
        b=tTOaU1wWvBR2peHIYeK+1g/juZX7ctNNeYiryPwkJpEMRACZo6rcxkBB2jqC/oxPow
         5miCuDyaJQg+UB8wVj9/ZLovvULwYg3lmZvB/t/40fpHod/OTB1seqs5aU/Md5q2M+QA
         ym5aaVepv402/oRCXKlUgbdeMffLaigGuTnHMAZt1/DwIA9jNm1Zni8hmLs0IIK1zEMU
         F58gE0hQBgI4vvX75Q5mdzuC2XOR31VNstqryNn1XCXICnsBlts4Ja3alR9Zx3ckyHU4
         ktbnLHAPBM4tuVnHN420abuy4OXmfsdJPwV7zRzYhI6g7jwAeJvw8EZzx0iNVDlAcIQx
         UKbQ==
X-Forwarded-Encrypted: i=1; AL+hErHeC+WmKZSZjdZCF+IFytn+nttAlY6xMNuLXVuFfChrZg9cWWsCUPLF4PkO/TyQZGeX4yfHUuxC8uRWp4Pt@vger.kernel.org
X-Gm-Message-State: APuU4Z9/otE4Nou9D7THVUe0WqVGmT0qpD/p+APW/9OqgDW6yHQk9XaS
	mrgd06mFLwOo/MAO1o3BcE7IF8RwA9LDiM1PF9K6I84YQKDm3Gr+z8BPOjBPZThSTQRVWumPaiL
	VgeT5PWoPB0pf/8lATWk5PDjPV03f/FEi1dqKwf1UGHVWb+sIKz1FKk+JaWGMHdzD+rgO
X-Gm-Gg: AYBFou2EqTFjYL6oGOenGVzwLy0SQ+uP7BHD2Ox2wMAsfBoCEEjfyTxu9pfpqpdGZzB
	EoiZeZASdPjBDPrwJu8NpZSinbiguZwrRwiA+4S2l0JinXe3r5BENrq6fN4zLA6ePBrQUcK7WJA
	jm2nMnccUyAr0jHmtMKiP/z0XIFafC62AkwNOQecjnNeFB0+XeLbVQfancHrN+fAgYXdM5v6B5I
	pRPo0cuyd53wzSE3xgzW9xb3KNOgt2eFZ1ZH3b/dyahx46eQaO1iwcEEToT5iAKbN7pqY5PcvWj
	nHe6AH6ih/h/ZAZJEN2VdEI/VvU7dhvYteaaJgO/ENMLZdSiNWwaBxR6fSSCQeXI/PHne1qRfh9
	jQ/FlyoW76KcYmTwrpvHiz8BNbyIIUv8Log9uCu5oKNn5bPZigOeBuI7nXrLEn9bYQBPWYBHplh
	MLAx/KtE82j779O8mrRBLL85Y=
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr2645470eec.27.1794591339713;
        Fri, 13 Nov 2026 09:35:39 -0800 (PST)
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr2645441eec.27.1794591338994;
        Fri, 13 Nov 2026 09:35:38 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm8661283eec.17.2026.11.13.09.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:35:38 -0800 (PST)
Message-ID: <3443393b-65e4-434f-8d3f-2a3bf81bf13d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:35:37 -0700
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
Subject: Re: [PATCH] accel/qaic: Harden checks in BO execute and wait IOCTLs
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261106194434.4062205-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXxEIogQRtb/G5
 UVP5d7zyBqi53x3q6NFXAaaIpmKBoVhSOu5Pf1yL0AalYUKK+Ha2ZWdhFZ4zoua/KbBbhYCEntB
 O4pYOPuVr+80hamgf9SN3ZV21lPJ9/I=
X-Proofpoint-GUID: 53Ble0cOQSgtzZ2WNyCknZT41q2deVF-
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af74a6c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_a0-uAXI4ZKTf_5tdocA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX/x17XUZd5YrE
 J2AnyAL3VfERY+hFAUqI0v0iUJlk1n61W1gVzjqGvxRXkQfoq5cn7KFkZMszRG5acGFQ+Um2jUb
 mRkcl63Wufp3MoKiAhxdGlq5oXKi3mDxRaM2gu637D+5z6/b4NcMvljla3+DXG0DxWSjPMzzeQ/
 UcfRDNnngXszdY++G/tIV36VQqfnzc1Ym/OgzYet7Ezro3nMG168Rt83voazBn5vdtCmrq4rTKQ
 m5RTfswVC8Ss1Uzw3OFlVXT7lAbmCYn1eDeaRCiOtbgZQ4tRD1z6HoFO2HFhMAnRVnEU0j+8hAk
 Y15UgH2BzDoc6lgSbUSJZXa2xbYEdKsvfX1lgZNM2qRBqMXtFQ8ymXX5hOEjr+ClgQU5GR7KGkE
 dXVUEa+P986ARKdAIf3qpsKPj3dSPGH/prZpkfsKu39rnszrJLexR8g1+9P4nL+RFIJyUPq2uOZ
 Bk9d2Kz+hD7qbLJ0eXQ==
X-Proofpoint-ORIG-GUID: 53Ble0cOQSgtzZ2WNyCknZT41q2deVF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On 11/6/2026 12:44 PM, Youssef Samir wrote:
> send_bo_list_to_device() does not validate if the BOs the user passes
> through DRM_QAIC_EXECUTE_BO and DRM_QAIC_PARTIAL_EXECUTE_BO IOCTLs are
> attached to the DBC provided. This allows the user to slice and attach
> BOs to one DBC, and execute them over another DBC.
> 
> The same case applies for qaic_wait_bo_ioctl() as well as it neither
> checks if the BO is sliced, nor if it attached to the passed DBC.
Looks like some minor typos - "as well," and "nor if it is"

I'll fixup when applying.

-Jeff
