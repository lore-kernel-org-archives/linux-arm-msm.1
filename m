Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F60448BAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516048; cv=none; b=kmeDdCRDwAmhcziMyqYrr20q8l4u2k0sZVr/DMTjf/tiwCwxGWmxZOdC986glnzf8T5FMRW9cqudhr8JFVtuiEPAryQxN1poypy7i9e7eBh1NK3gZZlZcSPpjx9Iw2IbG1cLCrlCiD2EwjEzopxwyUEwmeOaGJE1q6b6MOt52A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516048; c=relaxed/simple;
	bh=BSCMszIs1v1lUaezhNKG9JEUl95EoF3HTP+vL3koyoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR72vU2UF8tAmldgWoqRDHe4mRDrjE23A+Xk2Ri7dKvHA8nzk/RvN5MUMrDiNOL5X33NIGHV8U/XoLA07TRs4cXZIDxUV+bhRNcgrNKiQFOrT7eyCS8zmJHvuBZgLSIbxUngTtrrNxjMQuvGO8etAGjL1BIhwv6xiBP+6bWFncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdMyxYuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYoATRCg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdMyxYuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYoATRCg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n1em2839474
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 10:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=; b=TdMyxYuRIOrksRiP
	knS29FFj8adntQ2yTpJ57ECIJL8bpWaG4kiZjaiAOEp8lzoFuXP7fRWUJlUWfHLK
	xDzSvF71BwZrSzXufP//3VtGFDR/5tCNOmjd8eIevT6OIScwpeuNPIpJungXRLfI
	h5Bhp5NbXZXXZkYyBbPG2eMmNesBDp+5NvNdpGyV685hj060ia8FMtWXfoInWTTR
	5Jl17HRlpb0ik8bPFI8tdMXIKd23Qso8nsiyzMEztcaWPkdDmqOwVhv727dgIOvG
	YCIu7h/OT+hsCi501EUOIxusJXUQKX63Vtn+gtKEmI9N6o1nUlqFPaSnMFLmwbDe
	QxIuWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtrvhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 10:00:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7ef17031so1639111cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788516045; x=1789120845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=;
        b=MYoATRCgIDQWt4lLkchfJsEgNEfPG3jT2XKW87rN+5p4V+kFzZT/R8tsltUGFbZzVH
         XOwx4zspLoxRa6Qt+3R4cWWToLdi5HQ6KrmgrcmWXtG4RM3l0ooqwwjrFtW503sC87aL
         iFGHyXJyYl4YBEkYim8OQEc8fI+1H+lgHbk6S1QH3wjn8GjR2FzZqtv2SK2mGgzfwqab
         3Rk4YOioDNq6K+Dq4UqnFX6LNdB3Mp/4c4KHLpXJpizZ2HCyHsEDbY1bIsuaRNTzfVfi
         AOFYDI3sMNjVIKAQrHUgcYcJlRdBGAlhCOCp4iyG0du0mRdhBDqAvrQkSs4+l8YA0mnl
         ig5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516045; x=1789120845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=;
        b=rGPtX70lPGYZLmxrhpEmTyRuh4quEgwKNsJ7haGSiuABI8OPhCQ6aLNEhvrA4CtKUL
         yWW2mrRtVnY1rnrzQL4rXpJPM++0BLxF5UG3O9j3caaxwiGNUyKRtyRD71Fx2Yvx6m9j
         zfAkX3df0IqVotJE5r602Msf28c6mwa1uO659A3RlIdqq24pcwaPfD9CfnIOQtmpAVY/
         9zdfN8ShsGmFvDlhby1l0baVYQNrLi//7cKjwtjdiVaybNtF9eMcPXfPSaMWNylLEHFg
         UgmRIbBQRsS9UwdDN5jsenqV9ds6UcRdldEmyqJT5878D9eLO+/DFpfEyBHXeFqDg+GA
         P/5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7t3NFZEZ70lmEApMwwOgAKI0JWeyser5Xx3LYuOh99K6YFnf5wnJGD2omAungRBQ7u7zTlm+sd1fHzEf1@vger.kernel.org
X-Gm-Message-State: AFuF++mGu7465I6ZciV08bFdb83TkdnFLIVYmFvb0o7ThxhoIRfFkvEF
	BPiEQ9WD1oaMNylvlb5jJWRygfo+VSJakGCwwUaq7WO/zU14EJmI1vz5n6C07CunvJX1Z6C+32m
	bypGoZI51KPcQYyTae7C12dbB0WpIYsmlQObzi5kJjeXbfVsDjOltIY4raLLBmx8GdmaiKsYP3t
	oM
X-Gm-Gg: AYBFou2r+nkN0GkrLYMFt1fiLuB3LNl+Zk9bxM5oEL0SL2HQh7EX8VjFjGfti0cOBk1
	pudtmmB0hNK9hgzA//K4s32MiQBiTsVbgjTGlPdsHQrR0qSWawdQL7CX21zKtkocPkwGdk7Tgjq
	dtbg0csOcomwvWMI8Tvrkdujmc5lEvQaOLepL7Kn9z0TIvw5wEtW06w3MWJrpX6ffVnaeR9w6Fa
	TTh7GnYih/XED0ITWRykTXlSqCdb/AAMrG3DQvENv+j86Z3lV9vVXH0i4A5o/jyEHFidTmuWBA8
	QwjZP4xZ6Br9FcNNKTtJb9tN0m0Cy5HG3QJ5MBwoK1i3TRaJjmrPcX0lXLLznUW1+Zbfleu7Rwn
	V+OQHEjn2FvIpu+hKlHSO6g==
X-Received: by 2002:a05:620a:2803:b0:92e:6485:f640 with SMTP id af79cd13be357-939806bf77amr309601885a.4.1788516044931;
        Fri, 04 Sep 2026 03:00:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2803:b0:92e:6485:f640 with SMTP id af79cd13be357-939806bf77amr309594885a.4.1788516044198;
        Fri, 04 Sep 2026 03:00:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm87942566b.1.2026.09.04.03.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:00:43 -0700 (PDT)
Message-ID: <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9a96cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NRDhda5j7NX4QdZI1lEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: d77_0aSCcGEuHBN46Dtp8-t1U_EfB0Kp
X-Proofpoint-GUID: d77_0aSCcGEuHBN46Dtp8-t1U_EfB0Kp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX9N2tP6cmAm2u
 8xypkHBpMavD5BacR19ikGylYc58uit5+Omv2Pny1eAAjl23CrZogYyCx875zFaGIl8sKTRVXea
 RL8m+OB+55+K8YH6q8Ny4BLRLdwuB7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfXyyN39Ht0sElS
 cFvRU7S24c1F7JhMdMcyfwchrAxqoeMEVf6A6QTbhAX+oC4ACb8W5QOnobQMypHVwvPQU2pBiPS
 H1CM5IbPT4+efi+1TcXwrr7iKIxTh/xCrB6H2U177YzlUi+qXJrviMGYhYyEQfZHg0H9UjAnEWS
 xAg8O43iIp2RA1thRXnJa7dDxiF0xKsY/eQLojn+Uj5xwRD4Rs4fD+NuTjrH3d6FsSVnhQO9hzY
 WgTAqVZxfsANj4qb0KH3lgBWQxYZ3E76dYqAWVzJr8TqiEjuF5uXxRPz1RoKSwCVsp0gM/FXovA
 0vnRqV6AvjNg78Hxw4YgU3pNYgIGWJKNEHcGGrs/lsCwOQut8qbSFYiSpgqeG4LJ5wI+esbKI11
 /4mj0mmnYgaGJlmiAcmSssbIhP/1ycigSfvn6iDrIv023OKF1tjc+v1qxfPOayZC2RDphzD4vww
 sapG+VuyOokIBrZ2ZCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040089

On 9/4/26 10:16 AM, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> Tested on next-20260903
> 
> Dependencies:
> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
>   regulators

It still remains on something like 40% of the defined regulators
without any nearby comment justifying that - are all of these
intentional and necessary?

Konrad
