Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106736;
	b=Pm5DohCvkNMG8ggP9AIr6gaj0YcVmT6Ey0c1Q6DIiHwrCUewDtBjfYAQuZRP2uDao1iJ
	 s1Yvb3OgEkBaBM+lrWyd0X2Z3iwBfpANs4H09CKfanepCVwVyITWrteefm6z02USVN0Bh
	 Q/vNcrE0/t+mqmmrIKsCBE0L6E6H/aFkbCsyRdNSuxTwSOMtgj5IroMUsX2gABbUtiVjX
	 OqRvllZ0uQA+p+2cE2R0gvi30lX1We8a10otkECLWP6DbB6EpSc58rP7CX0uKsHVRHhV5
	 VwJhw+Dxb2dcpL+i1kEHp6WHQiXmKxUUY93zHq1Zc8ENoThGSvb6yn7aF9rwW+BIjTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
	b=WhFCN+kT8u1P+1tEmdMj8X7j4zqH8eZt+YUcSZXNSbW67/1KAkwca8b8qT1kK4+NyBVa
	 M6NNxuVBJQfCqeemhSfSwoSwrlHGn4tEdutSqtMq34WArqSKJ5g0GaNiKvm9NWAQDOjNs
	 k0BVRCt+t9pwi90+j1TJzody0/L74cmxR1R2BVgoFZ8SA3RObsiAvp8x1gStJidGYsZvX
	 QH7ecTwfEtH1SctO9y2qKRQxQ0WoTHo8eE4Db6i6tuaY3n4p+WC30SPWfMoh2URoZgpbK
	 iM57L2f/K05ob1UPBH+se0uQ+wZz+FNGgMQSrJ4d23m4RR+NSBd9ppwhVwUyqUQNEsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAw42nz6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE892606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE892606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAw42nz6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4EG1935912
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=; b=d0i6sBX94Z5GJjN+
	2clrqpaZZ7pFbAJQv+7lWo2nSHGqPVYiQlDEho073CkcRpPw9bdHwvp9GzRYLtVi
	LHoXA1E0KX191jlWuNU3clKwM1s8GSCj/0KrC3sin4lRnMg2ZBvUULT3azjVPLXD
	vl6SXZHU9lDtTsU+4Kxc1yaEB5KFYEWzbT8BvgexbhzqP1oP1qlaAs9Vu+I4VyOU
	0KZ/nYyBoexKxMNakYR2K34ZA3pk8ksn2KXqrPZaohBG7HSjgUGW1jXFHt1Eb44v
	icRpKvhrdWYKiE0ZrJsMTYSYW0eHb+mCRkeMv2w7xRr7cVjUwMHsYkHhniqbKULi
	SdKubA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavu04g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:12:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7318452eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106734; x=1793711534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=AAw42nz65DBqkgcxnnscduH+TFqi5eW2svsImiffOsPl8VzpQMssa7Hm7c+YyL6UsC
         wE1Axf/BgpxPAX9eiO/LbJmVDbmLaOAAkg4t/I7zAo+6lvcksa83LGW9NCy8TMHojFd3
         aJhUijSq7BKh1PPZFoWb/Uyy9HI/9V/xBoOpzQ0tvXVuNWVuGQlfXHp5hzq5jziLB+t+
         yfQSL6b+GjCabWizFv41qu8pU7b0WcJcqhXxOTgX16zRr+Dc+XTYawZs78hHpkkJDWxq
         eqevOcyHKC1ysxWOFGzOvq708UqrA1ajEhyeHhLjkmgsd7Ss3nT0uUT/B/qsX9RBaFdP
         kZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106734; x=1793711534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=D3WjnukoFeEyvUCX4XfRlNHYtHSSdNxSbd9ImfJu/nA8iOyjcDNk5IZ++O/1oAxsVk
         mxQ/jcwiS87lhHV6d56x1uiR42nG/pVljmO/ZZPXZKCrb4UP6Sqo6YVvK7Xn8WVm/C38
         CG7B+Vc9Dbs8DT72y/zshgh8NKpoa3BDa7PoIpFGucbgN8jdpldR1wdiulWWkpmCrv6S
         ThfPG1y4wPyAwcoYuZszECZknBWXE7i7ekzmihut89p6MpXYfcf8UITDgFLgLgenDyZp
         fIl38ptYksGSzJ8hshTqJPS48J0RY7LEae2n+/xevSiysqdLXGCgniupec6DGoEYDZ7a
         SvSw==
X-Forwarded-Encrypted: i=1; AKwUvBxSOBMtmF1slS2ZtbhHPc1NrgCaqfGka+Hp3vjKXG5iOUHyL9P+S9MtzY1Gb+0/JQGNW5+KyPPdpOLNbxYL@vger.kernel.org
X-Gm-Message-State: AFq9FYLeK2TVwWwu87mrPIJKqbb9vqBO35VDjrimzyaMqt3RHLUOJEu5
	/NeBnGJmABEd9N47Q5UBI9n5SV6Jc1iOQbaWxbr1+9B7cmBYQpg41KBW5qP7Gx1qWR6u3z6aoiw
	lAGmPUzcP+7RWhS1+7W25nM0M3zOlFXONIKt4i1CnirH+RFn9bo+FE89j0sLffw/v8bk2
X-Gm-Gg: AYBFou2htN97crYuiAW4WWNEpEOl7QoXlPlWkXRDmgMmDVwu1i5E3/lqA+PCATMf7qg
	qk06llvFFze1lFw+kCOMCT8S41UAt+OoyhZukUGWbidS7uWZYStEaigM3urC+jWwSesUr8oWHoj
	3Dk9mLBkCdzewkyJ/FRoK8ub4j2ZDlRBwMzMPerlgJjAhSFnh1dMO7KnQ3Xcb/FjcaaTXhtxk7p
	HjWsMeuHYSUROgpsrJhibxRn9Oqazt6NODfKFUDry2AhaSN+nJ8yIlGnynPBU4UTsf6A3bMlpgb
	WevVZBSLH0xrFtqUdlHMH8TqJrxsHgzydxeMxJd91TUhqwAdiAcdyKXN+TN427ilUxjZ6CCaUor
	NC58TSpEubGf8MBlKgPmreq4OpQ==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973439eec.11.1793106733512;
        Tue, 27 Oct 2026 06:12:13 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973405eec.11.1793106732892;
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm7325798eec.14.2026.10.27.06.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Message-ID: <e2147521-c736-4cfa-b482-e534a2a11a72@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:04 +0530
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
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
 <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 22gStNPgGTtnX9F3rU7mOBubewEvLHgu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX2YLyx3eIy1ly
 cZptVbcBw+G0goWx+tsA+51LeAzsmVhyptDa7A2lJedp1YxzbSsqXjTF2sCViWfHuswk4iCV2ix
 atzk/uxGKgsDAcRn8e9OjAWUTCWWxEQ=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae0a32e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hn2XikViVj-BPx_B1YEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 22gStNPgGTtnX9F3rU7mOBubewEvLHgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX70OKxv3SE3QL
 yLdFHEuaCmJlHIkGn64RsUXtCz9C4J/YYu4ynN8RnKkuccm+WpKBGbbZrAM0VGixMp75xw2xQ/X
 IUAs3ICettz13zPb/kfeJf6DChvWncuOweoTVsPb5gF4YPPXzbjR2uCS34l1B77tQpfaUtyNn6x
 8+DRn6/CTWegKaUxqJEnojs9jq/85h4tjY1wEKcdoMAs3znnPhW2ra16oOIBvCokDK+w3vGoj+Z
 x4cwi5DpD5G8YfuwH2fvjNyiwVO0Kd/XtdF/tMC2yUZcKWWTU7O1ooV4eKoMQ0b22b1w6wwCo+r
 LRfJBJzp8EijWOHcuZ4J2OxTcu4TQm6c2j8X+XoNU6IV4Xnro6h+1N6vgMXgUxhP6W2inaaCH7j
 rpbxdWeucZcfZ8/4c1Z6es+XxEABa40YpgRrCZhj3DLgumONsMsncerINSJ2dY0iYTLANaaAnm7
 OiiQz/q9Ne6pd5lUBfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270052



On 27-10-2026 16:29, Abel Vesa wrote:
> On 26-10-27 11:23:25, Sneh Mankad wrote:
>> On 20-10-2026 18:30, Abel Vesa wrote:
>>> On 26-10-15 15:25:22, Sneh Mankad wrote:
>>>> To make the MPM design more logical and avoid probe dependencies, the RPM
>>>> notification is managed by registering for CPU_PM notifications.
>>>>
>>>> Remove #power-domain-cells property from MPM device.
>>>
>>> Can you elaborate a bit on how the two phrases above are related?
>>
>> The MPM driver now supports two ways to handle sending the RPM notification,
>> either in the genPD's power_off callback as power domain provider, or within
>> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
>> driver to follow the latter path, which as explained in cover letter would
>> help avoid probe dependencies.
> 
> This should go into commit message, I think.

Sure will include that in commit description.

Thanks,
Sneh

