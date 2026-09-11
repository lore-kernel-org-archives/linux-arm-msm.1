Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F4389104
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158830; cv=none; b=aKE6HBSLXUo1EXyoEADY79ib84k2+7bP38w3paEVtdjJ1T5+bWSLF763de0XxFoW5Bjpgmn7NkcxOqLiDopAClcsLaHuym221lu/3DsLm2BfQK3oktcQxrCWspmyJwiV8j9L+N1ak8UJpStQB6w5ozMXGmgFUdv7FfJX82JIvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158830; c=relaxed/simple;
	bh=rxrU9Z3T7gqcTgXERMJIoMWeuJ+okTnGoXWmPT16i54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W33zmEB15AFbrzUI0bJtcqkhmOCtsHccwwfQ3hM/OkckpI7yOwdOZhOsxkT8V7hnL16JKZqB07nu31SyuaTd4s6BmVpfHBkW0MT7Cxg1oIrjLm3mLFeBgJ05FMsGCWHp+2IRY7AV01jJiEK2gKZ/q7cMIVN2a6++TiurmeSqO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWrsTIB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMqROgCq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWrsTIB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMqROgCq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWjnO3622041
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 20:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IPqDuq0pRw4lbQ5pSC1g/+jS
	lk6nJKPgi6L/QwNJUG4=; b=HWrsTIB78dnLABjMeYbxEbLDbye3CEUHxlSc7qtO
	wHOE5HKd+jP/6SVu+SCKlmXOMXN7KW88Emsoz8j7g6vEpud5lCROY4Euq49oE2FO
	2UZvRH+S9V1D0PqG2JYWmvCHzCEq/kdAVSSgbiW2xaGELB1rut4as379V7wWfsv2
	LTkvxZlQcsddTQYGlkJp49ui1JPxGX87wxzaX7XaEAHGQmo2WvdgcoKoCStOLVU6
	hHGcasJ5EaBM/WD5i8j9MspjJ/TpvN14ePOMU+wmhJQNokfHHucPCgvgIA/v2FMK
	3gSiXqIfyNAqSCbFlj4EW+QASRWwyTffbkwPstOiYE5cjA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubs0h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 20:33:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso2173838a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789158824; x=1789763624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPqDuq0pRw4lbQ5pSC1g/+jSlk6nJKPgi6L/QwNJUG4=;
        b=AMqROgCqhSw22EBzlQuXcJ+IszFpx+6WLvHiUu4d/3H/1LHEsPDkDktNlZMBOo1SE7
         M2EsbfGnPC+UVN+YH32l5NlWTtVK62+c1ZPCFSlEdrA5PwWBTYg3JRuFq5OhJz5R9krq
         jOlkDxky5qdTVHqohAqZqT0JOrcdUBKUf7Ht418cUxLGvH7S3FLbiA7piGmzrOPmVWeb
         X6GvgpANGf+Q/xlgDtJ9o6GwcscT9BW0fKhe7TpWqBPi8gJDVNJdnVdJCsanorbs4HT6
         rQpbp8sU9j+1ss92/l4GFgedmpDVwz3r3i0RWN6gyYpbGq824hmLFLtpXpIsQ4nQCtCq
         poOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158824; x=1789763624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPqDuq0pRw4lbQ5pSC1g/+jSlk6nJKPgi6L/QwNJUG4=;
        b=oMUxK4jeNDEswfHHyms4MRxOqYqqcmC6yfITc2OtoeWaCUeFpLYXZx8Z5VtHx6ZxnW
         33ayNLh77+NtqSq9vtZBhboeWb2OLfyj/xFKcJAEotCJz5NErbn4iyT6XfRZEa57jqCH
         DdbedZZGLdxTAX3FL/NaF5+IEl0/mnY48btO6iIgYvJMYEsXd+CEVCDeEAeNoPqVY82J
         lmb2/FJlW9+5CBKTVR1+JK1+P2a/yC3BNDiwE/ReCJvulRCutZwrKWKB1LueEmA3rpiK
         J88KMkgYPLqRa6/oVtiLv00GGfOhH6t66bsW3B+pzMM3YKSJvpQ3ltfA1FZGXXeaK7N9
         QGdg==
X-Forwarded-Encrypted: i=1; AKwUvBzbdnrinY04ENf0QnO7UvUoBwkKH5CUXwujk1Twx9j2l70NC8titlKvIUBe0LfYVljth3I/xC3ufuLUDdPh@vger.kernel.org
X-Gm-Message-State: AFuF++n2kTg9dqoEqzefssji3Do+EIIJBgjjhrtXkXggBYwezpKjhHv2
	hiDOvh7Hfrk4wcKGumhq0qgPGPHxIlWP1YIdwtdlDoGcWuxI7io/whHDYRQY1sUrGpBM7g/6+61
	fBkHNWa2CLQYf5v/uv5jXSMdkPKaf0b4Jz/aA+qcdhkBibpoqw4xSUHFqBUv82IGp8zy+Jgb5Qt
	cA
X-Gm-Gg: AYBFou20tmPPFq6YaNU7QWlUHrxL3AJYhYBahMMtthfBRKoJHpUCJ6QnFr7q45eIAVQ
	cv24o/VPu7ONZSmLa87/LBZI9cYk8LqD2R5eLxvq2qCMMRmElru1XCruGFM9rO3x6CNWk4cP+Xx
	4KI4TxCMAtpvY7eW6wywnNfuihB/qpgROiTCA8jl9kcrCQYjjRN9Vd5d1+CnoOswv2QNmz34/po
	kkZ3Iwz0lT2AMBBKp6SZZOKF99oQBiqyFHIYvi1ViKzxSfScPX7JzDKOYc2mp9WHIqMS65E0j2l
	hF6hVJlOnwfHKA6QFQV2hPECowU/rpwJZJx2BZTOLOxj2MWaJfEToDDjonPiu7cgwfuAiBP1Xyl
	2FC047e3el4Z5pLsYPzn+EFdO7gj9mw==
X-Received: by 2002:a05:6300:6cc3:10b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3daf21a255emr6162771637.22.1789158824612;
        Fri, 11 Sep 2026 13:33:44 -0700 (PDT)
X-Received: by 2002:a05:6300:6cc3:10b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3daf21a255emr6162746637.22.1789158824221;
        Fri, 11 Sep 2026 13:33:44 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm8410818c88.15.2026.09.11.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:43 -0700 (PDT)
Date: Sat, 12 Sep 2026 02:03:37 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <kgay5aouizrcft67vpfubbmvjiocsujyt3uw6uboyt5au5gdzd@ayb2t7iq7mho>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
 <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
 <e9a39278-dbc5-46b1-8d74-581dac008b3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a39278-dbc5-46b1-8d74-581dac008b3f@oss.qualcomm.com>
X-Proofpoint-GUID: 5hvZKrQGuv5I_32qk6UkCrloX5xO0xbc
X-Proofpoint-ORIG-GUID: 5hvZKrQGuv5I_32qk6UkCrloX5xO0xbc
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa465a9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=0eChJe0SIIvfKPJWEoEA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI5MCBTYWx0ZWRfXwzgM4NL8zJOl
 eX5f0OoVY32KC62qkE3X/soaexLqZ9UBQjD7ILJrm1BV9WngWRLdk3hrPWrtYDhXMYoK4Rzo/46
 212ACpRFvhccCVQqvhEqHjZVmV1bc7FnEH3JgkXUIT0I9JzMpYaZ8BVNFqB15ki2YdgYciJvNe0
 DMG7WjEwf4OVaXpzHVRGqD30psflpuurA1glzk+fSjQqJ1qyUdkMOugmk4zOGdG8Fjlnw5waUct
 zsAHGg0zNqJLj5xjbtKQ2V3g59gyCQMeiwKBGNol9pBGd6RYakPze6P3qr3V+DGzz2S3IWuHDfq
 x9h3Sr+Vqfeu6pHeIlkoQtE/dK+Viy5DtRcR74STVodD7H2xdWtq2QRFGLkMMrYkb/rQPDlz9g9
 Qh2roBS7cOBF7t6sTf4mCAO1wQsEJ+1CG7i5khPtUzT16WqkRZuwn57n9Ou3mUlu5K4bjPBlywH
 cH6JOk1UDGxbgFxZICw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI5MCBTYWx0ZWRfX8Qq/S6KdNCR8
 5//W9cDoExe8jvcYKpZql2nsRBa2mtX8+IeUfNe1PkiQBUPGqxjvnER7FbNLOeQJxvzxvcffklV
 9VZ2aOkreEw0Lui5m6nAFhfu59iHqXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110290

On Wed, Sep 09, 2026 at 03:50:22PM +0200, Konrad Dybcio wrote:
> On 9/9/26 3:16 PM, Shawn Guo wrote:
> > On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
> >> On 9/7/26 2:06 PM, Shawn Guo wrote:
> >>> On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> >>>> On 9/4/26 10:16 AM, Shawn Guo wrote:
> >>>>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> >>>>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> >>>>> initial device tree for the Nord Ride Embedded board.
> 
> [...]
> 
> >>> - Supplies of Nord SoC
> >>>
> >>>   vreg_l7a_1p2     -->  VDD_PX14
> >>
> >> Does RPMH require HLOS to cast these votes? Generally such supplies
> >> should be taken care of in the fw
> > 
> > Good point! I just did a couple of tests by:
> > 
> > - dropping regulator-always-on/regulator-boot-on from these regulators
> > - dropping these regulators completely from DTS
> > 
> > Both booted fine (the nhlos software for Nord Embedded variant are still
> > under heavy development though).
> > 
> > So what do you prefer, dropping always-on/boot-on property or
> > the regulators completely?
> 
> I think it's best to reach out to the PMIC folks and ask what they think
> 
> +Kamal?

On Kaanapali i see that VDD_PX14 is actually controlled from the audio codec side.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts?h=v7.3-rc2#232
but better to confirm from the audio side.

+Ravi Hothi 
can you please clarify? if vreg_l7a_1p2 (VDD_PX14) needs to be controlled from APPS side for Nord?

Regards,
Kamal

> 
> Konrad
