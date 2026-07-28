Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE5743031B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240072; cv=none; b=mB//eP6Bpc5u8ChzWvwa34pMH7agJmTEL6o/aY6u2iFllQjdzAXY1dHq9qtc9xSJv3De8UcSle+df0LzAuQtFvqvGxebF4faLFhqIoctgCLxdFRqn3HtyYvIzCX6zOek1i5k2RNOdo052eoA6EpWf9crcEBdfkwcQGOuAHOPh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240072; c=relaxed/simple;
	bh=yL3m1Dg9btJVeHWrdnP8VRbNZ5yhiePsfHJrBUcz5GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MR8ok3vtX9sq81t7k33BWg2FWkdsQIKRXf4GHuZ09822bLW4kkQ0x3PyWM+7/rZfy2gMGgaGn3N1xs9ctqa140opifZy7PnFCnGgxfISUXXD0D0k2ELuzu9LCsNeia/dcLPcB+jt+XqzP8fbWXo+TM03Dfl7UytWww0IGRKCHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSdHniTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E97X+ew8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSdHniTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E97X+ew8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHJwe2367347
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PH+MS/OXafdOZl+CyaSuL6lgweSk0MpcC245rz5MU4o=; b=NSdHniTcBqHUfRK9
	HnJ409ylh4rghH4W6/EK4uucVg5YNDNyqhuMeKt1op10jgNVcuhBpho89bkQTQ5Y
	qGxQtLyKKxDvj+9PhnfdSHRw4NvzhKgcxhDRwHMJe9aDeIswX4VxW1ExQLro1Rzx
	C2KML8/Np+Geqyg6Q7nq0PtQxwdeImN0hxC+hz8LfmPymBOdQCjEdYBLkY8hOvLC
	QWKdYfPFDDD4NrQjtCQFA1oIhm9qTIPzSwP9UsP2PMZAfVfgeHVsgW7Z386Qxe4O
	qvusPhoUC+Uvh9lFqE3D748rHD6nh0hMPtuyorSPX5q67csPd7ic7KS4OlLiZeWU
	oslW1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c687-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:01:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so7098291cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240069; x=1785844869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PH+MS/OXafdOZl+CyaSuL6lgweSk0MpcC245rz5MU4o=;
        b=E97X+ew8o8vvAEt/ja7XQjR/aaOiolLJCkIWskVjYXEt3ELPS+ARINyJ2wtdhxE0M0
         lkf1svOMBWXwaIC+gcOjIUJMefDPZ4KbhXMBE8RMPZ8HwNJ4hqfGMydEAADPxqs2dvKw
         JGjl4iFHBBKlwBpzktgog/fwBKLxsvH+bVZRmDktmpGy8YYSIdoYiX5WvpMhqmzmfJO9
         cq3fc1GThIKGG1LQXKHezf/7T1Ykv0Smq2yLwvwn2cUE/NiJ/uI+UAjAfHoqo0yCJuEw
         di0+it5cEhnLVUWsIs6Yeg6SBO+UB1Y4/GVZlxwL6EjM4YcfXNROrwxGSp8Tzt9rqx1r
         Jb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240069; x=1785844869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH+MS/OXafdOZl+CyaSuL6lgweSk0MpcC245rz5MU4o=;
        b=dMHxG0hEC7lx4rrTswKwnZl/O+E2YH1Q2OXq7jRu9O7B8kplb4m71JRbbSb5TTbpIG
         3LQe3jmtPiV4u/4LhPe5DkLwL6DuFn+SjYlowyBMq6lQswNWRsXf8JzPee4O8igTRtZf
         k6DxYzRqBgm9t6aW0r//6A8/re94Eb433oM5It+1sODZK6kLcxgBLOqVGEizOABZw9NI
         D2rTg6d/CkTONJ87pSv0dMCfiPsG2aQ9oizaT0jJMYAeDkCbOtM3AwAV7xbzC/pmq5az
         bQvQHW80bHB9Vv2sa3C4WVDGvubnu9DyQUVo2vW9eA6dYdmuvJvMcqcTD2WSf2qFffMk
         kpyg==
X-Gm-Message-State: AOJu0YytMkgOtFhaAd9K1XogGXfvqCf0PfmZwXt7A38Y2dUiAoha/WrK
	p+SIjXkTxigv3XQ1XFeY+5dLWHf60HIQPxAtFy8GTLpQKSH1kNLUxdXEvIqca2D25pCCKMFz3fp
	5qpxnjwQf1b4/JC0HPC2OYH/zG4Xd9+mtsnGA3xrUAu4SgZRpEQMVVvq1znjtiiR07LFF
X-Gm-Gg: AR+sD13hBO53j5Nbf4FgLQ9ZmPY00h+Q7RC1ZcUdkiTaml0Wo884E0RhYWrfGZ4DZ5P
	nSXsbsJkp8lxodwc7IxiRgBA9J/vuZAzj0YJXAJQH4Llqk4cO/nK/1hOJIGxhKYFTwGxBMA0M6t
	4dbwVSDd3HXEMmz3ZcsTGXOtF3wBq9NBxi/+MhOGklVk3UxsswGjt+Nuh2EME/Rfh+kQIgMl7oq
	BD9IFefzfkUDkV8C9mbrPOGpzGgJT8gPO0CxKdFldph2u46skcFKWWzyu3fpkeFv0FxCmsecunK
	kDsO5SN0VG46w1BAMHlbEJreTMHrYqmlgcFmE9eY0M1zI2Sc78i1s0sERWFhbJ8bONp5MVCCf/X
	KylvPsSoX55Iq/hMmiSdgKaa/
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr10074941cf.3.1785240065882;
        Tue, 28 Jul 2026 05:01:05 -0700 (PDT)
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr10074491cf.3.1785240065351;
        Tue, 28 Jul 2026 05:01:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm4137581a12.26.2026.07.28.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:01:04 -0700 (PDT)
Message-ID: <3a8a35b1-465c-419c-aaa1-5d272a1ae98b@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 14:01:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs
 node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfXzB6NS6d9E5wr
 Xmd6wIaJjNrPIouT/wmEcJFHQaaFYsnrkIKZw2kb3jqaWgXFTHxj1WKMK1BsEEAPO/Ju0+waf3v
 +b5foBpoSN8shsOsrV0NUMwC4jvYZNw=
X-Proofpoint-GUID: bBdDdZriNu6VofpcP6nyCxYSpRIM2AhV
X-Proofpoint-ORIG-GUID: bBdDdZriNu6VofpcP6nyCxYSpRIM2AhV
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a689a05 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QLsariRrJL-ENzfB6-EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfXzx35lFmB9bmw
 CyrV/B2MmKksCy80tv0euJHoQeIjIarybeWVb9rvilntG/87dB2nkj7xexvhWwiB0yV8Qs08e9M
 jiJlVLdIZXY4QGb0M5W8zk2u+3VY8p71IqaXG/fZLLBxpCz+YF6WPhes9a3s3C1Td19KWis+Jjz
 hlp2GTFIPZS7Jn57b7nk4LZ6wy/fOk0sRjfH+m6eiHO6JkI/SCVNfNDV7cwODPWSG9es3k6Wj0n
 s5libAZqXD7kvFt9VpHf0OtR6HLEOkNdHY6QIWPEO2EkHDWxTAqBbwX2cAbvDOYJRM8mabmiLgj
 Gntaa80l2qCVnuYth+h0hPoyRuP8HqmQKnNPyYExBAf5OyKw7SZvtihlXFGuup27xHKPj26P58f
 +sKXhsaNY8Re+CvwsX0koPah0Ht4jAWFswwkhbH4bifaQNmfwUoPyH521e5LGqtb11lvEb5JsC+
 WKmnBwczqFYkpm79qYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105

On 7/23/26 7:32 PM, Krishna Kurapati wrote:
> The High-speed only controller is DRD capable. Hence move the dr_mode
> property to platform DTS and mark the controller as role switch capable.
> 
> While at it, since its high-speed only controller, disable pipe clock
> requirement.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
