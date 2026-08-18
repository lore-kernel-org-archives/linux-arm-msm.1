Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439CC45348D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049547; cv=none; b=V91HynR25rvYI9oDdaNs/kKANXWZ1oF3ZuIaPfN8UdzpLucBG3ad1t56Eosy2QyfB5jm38PdiYrND9noB6LW9MawzsoZ9GxvUki99LwKLzgTKqKQAmXEgWd1Z+nQ2TXtR9HrYxTQ/4dgYS+p5o8FBNfR09BZpqDxj7sLKEJpXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049547; c=relaxed/simple;
	bh=lAtPc9rzrlFGMabNWDqG0AT0qvpRUeLCRaeYRT6TOFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giO4wrjpOb10yl5d2utYV9icLBxE8mDSFRmdyqW5Y7bUyjS7yC2Re8gqgARW8iP6xzAdpZ3RKxEt7379NIfQhVl9x9QtJQKiF1ik5vUut/eFNgQH/8afn8Xq19qv4SaOXpYfdEzmM+/k3lne122e7no4HVGnz2xuInJcMGPhAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWOPQPWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4hzaRnV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWOPQPWa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4hzaRnV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABIgY514957
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVmUxPVCbmg7yj/NE5q4TGeDCNpmSHEyTY00RCbjGKQ=; b=YWOPQPWaEm1jv08h
	CKnGvBzjon0GIdq4bYTxLHNEWoDWTk/OsGdV/XsdpUDR+VYabd/E5wXx9Coc1CAJ
	4yjrmCSSCKMHJeegxbjBwFfZ7jHv3cfaXmMePmkOPJaPXblw1KNQbYGIhaQeU8f6
	aQOvw640NU5KqheISN0OjcLu3GKO+WZAMOoJzpIygSqIOW/E/vEWcrsWcFaWJEqW
	VefqWJLsN25U/aR21ZpSJfrfukoq6yevsqUOwuo1MdTxVlQzA+67h0CIcpYV0Q5W
	iy+8n4ApGZkD6zuiLqaImgCKiI7MDjPyqmNMo7koNfN4jrKp7F6c6NzNKotfKw1f
	62RW8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2j1nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:39:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so4855085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049544; x=1787654344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVmUxPVCbmg7yj/NE5q4TGeDCNpmSHEyTY00RCbjGKQ=;
        b=Z4hzaRnVAna2FMglTQz8yYtsTeQfTCkpNO7shH9cykkGSQJ/QAElxXEe7q2dA6oioe
         tVriX2S3uGV34rkXdODn0KQwWzDTkxao+gFDl5Y5RKOdGkeT8sFlEvs+oaX/EMh9LB5i
         SdIYLuJZ3BNEYmLTss0KreF4x+2JidZ/pBX+Z4b9ogZ15On6t1K7xzYxhP1yi+A8DV9G
         4w38ETYS34M+ctiHA+TZPhytt0wAUoFcbFBiE+C2W9p5oxF2ibQ6jIU+a8tMYzb9dMtE
         lWT7I/tOgy8FN30hPgCWxTm4lWinPXKFIaCv2UL6SMwfa9e5RivCgi/rq2mcXYkbKVkg
         5FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049544; x=1787654344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVmUxPVCbmg7yj/NE5q4TGeDCNpmSHEyTY00RCbjGKQ=;
        b=AttloqotQHPSK1MmS0TWspKWxMdlEkoIz4jbpKvjA1ToRV1r2nZABYwxo9FxGlkbLw
         EikPAiNqUENnGUOjkBFOiop+WiCJWkLs5IctSAVPrv2dwelwUquPld89sp5N8hQJBamK
         NuyEnSkJtaG2et3I1ORPRdeGV/RWnnTRPcZei5fCvOU67kVIPymHtAvN/iD4aikF+ggM
         9JIPfUvu7On1ScqLa/95qkGWwxgRYqPW7RRylHihCGAyry5/ITNHUkpT179iZGDCViAW
         PHFcJWdD2AcqN+Y4NgAAwV7iilk5qrK0KO86U3Pvuxh/06YC13VRCPsdidkfJtoXDbLK
         biiw==
X-Forwarded-Encrypted: i=1; AHgh+RqQsMyOu27ZKQ92HxXoR5ppBxI9xChQD9/nozwyaXg3oPMO1BmClH8S5hyuAkzHHkK+CWGipStV2sTrfOMW@vger.kernel.org
X-Gm-Message-State: AOJu0YyTIQbTMtQIeQQsDNIJ3GbWneuBrx3ZQmB8TT6ZSijLGyA9KfGg
	W+o7SPX2Z4WtNKCZKhHR4nrz3Eu9VCL/3x7C5xgCp89GDxGCU3/YhEHyIM7C+FUlMjx1wJ7ss7U
	7/U6y7KEk4AsxOULqxHptc9937pIM06fRGTRwVf5wvQ6+Ix/QPp8R3srC9chx78KRW580
X-Gm-Gg: AR+sD13hGkfAiuh04/B8/cT85zXcYNJQajeom1qHT6VO6jDG/aM40btnNUWkPEjLND+
	43taQAPnNteykhMBXho7TIv06aGWdm/sRWIF3HWGW2GWEYCxeveKTwPEQRbxZIdXeUcAaoiMThz
	5xGcKwmbjjTXETH9nq29eoaPLsH+jyJMcU5mbVkNFYt1sem9qSYliiAOXUS9T7tUz+l43bWO1m6
	OyablIwfJBQSw/VyDS6HS4rLUQwhPwKT6TtLvyu6w97G06J8LHy4PhjzMT3FfPI3Uk3HzIzlENQ
	W2dZaAmZ6AxBn1vYT9r8FDUb6fQpbhXuAC158cJwtAG+d4wX9gRcqZwLUGe/SHJ4LTcQVIp0L8p
	QkM/OC7/DCl8qg0VeDs6TCrPh
X-Received: by 2002:a05:620a:2a12:b0:933:9bf:cc73 with SMTP id af79cd13be357-936d2357528mr2423696785a.3.1787049544501;
        Tue, 18 Aug 2026 03:39:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:933:9bf:cc73 with SMTP id af79cd13be357-936d2357528mr2423693685a.3.1787049544119;
        Tue, 18 Aug 2026 03:39:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6aa89sm166585566b.2.2026.08.18.03.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:39:03 -0700 (PDT)
Message-ID: <9fab8686-d0fa-40df-a6d0-75349861d78a@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:39:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: glymur eDP PHY (v8): link trains only at HBR3, all lower rates
 fail
To: Jesse Casco <jesse.casco@gmail.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260808171321.133028-1-jesse.casco@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808171321.133028-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX6nYYbXK7clGq
 f4vzx6QWwI6aAi70HTcSu7qhRm+B90Tbt5jkpolJTId0kORWXBLdmb1uxRPEUTORb9V5G4oeV0c
 HnxX6nJcz7/aKlQADJS96ij7fPkh9I7JqW1E1Zayb6MiEx5zNxJ16rDtejrBCsYuVoOUgwkeB5P
 XFVISqyAkfDXLWeAcmK2LJd4Bnn5no558gOz901gKj6sGUYjSM22DY6lGw9r1z/NrIqHdAUsV/J
 aYqIqmSovstPLIMIsIGYI2TJeusy3SzkkbeQnD6gd4RNFIY8ykeYnTnIkK/hHDV6+niJD5LDd9U
 EJBKu9IvrAkisX4RAOlRKz2v4MXYkxSr3wMMb5o5NMrxe9QwOU+CBQFlKoi12BS10/U/Q8Ps7D3
 f9dm2g8TxxWkEBKTO0kR+S07r1o3K5zzV5E1Qg2irRmj/nrWgm9TcOW10FudxCgEiXTvg4IqMyd
 PrUWeGn96GYpPulwDpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXwYHDuLHgPOAp
 oa7D2LRG5qwjWGCX4YSffPzjDZzvkHthnwIrOvtCyi8/1zkY2BuXk6i6RACo8cUWryW2LaQq7nm
 Pg1yMPa1CiKJWhXaQmHLAaCzN8FvXDM=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a843649 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nkM7kGyF-zu4sKUpaxcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lPqS2sLYXl3mgVdrcR5C4ahLDp31uU5t
X-Proofpoint-GUID: lPqS2sLYXl3mgVdrcR5C4ahLDp31uU5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180078

On 8/8/26 7:13 PM, Jesse Casco wrote:
> Hi Abel,
> 
> On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme) the internal
> eDP panel never comes up on mainline. It is the link rate: the v8 eDP PHY
> appears to bring up a usable link only at HBR3.
> 
> Tested on linux-next next-20260713, next-20260803 and next-20260807, where
> phy-qcom-edp.c is byte-identical -- so not a recent regression, and the May
> 2026 series (eDP low-vdiff LDO config, unified swing/pre-emphasis tables,
> eDP/DP mode switch) is present in the tree tested here. The sweep below is
> from next-20260803; the machine has since run next-20260807 as its daily
> driver, where HBR3 still trains every boot.

I mentioned in my submission that this series is required on top:

https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/

Konrad
