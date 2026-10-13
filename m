Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C9A4E13EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889064; cv=none; b=uKcrxOYAx5bc22pStGzVFPxEaDOoOsuo0VNhTn9Ksp2Pw9zBFPwnwQPI4voC/mGHbDv2wEEpeLmk30zPiSTinKJVvjkdeXy1zp/+cm7CQ1F4vlwa+c/hDfk460ixYeHV9yRmefELIo/nMQEQu40V8jAofSwMauxzTzNLi8W4mls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889064; c=relaxed/simple;
	bh=LeuVRKKz/qv40OJ9BUPv9V7/knp4nTd44u+8dX3auLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjkhBGiemQqArMm6+/tofJvdvxKpmSBRzHyfbkKtikrXtnNhQw4+3lkfTj+4BIja9xGoRplAR+sjr421LSiBOZ3ZWmXkSNZ60FXqbWsqjojCLsTGmXSokKP12xM0/C40h9BSAhZPpDzFmztE7tVmKWOQ7CcrZI0oCLL154q5K3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I90/xmiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNLvTxuV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I90/xmiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNLvTxuV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8OhiZ3055513
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSEpmU69diOtyJsEu93q34ttA2iL6Hvw0WchJvAmD5o=; b=I90/xmiCWR8WibwX
	oOgEZXTkzbFZSo65c6ZLMdeB7caCxJnWtUeLDHUOk0gBOrnavgTaEQ6wZSqKWPWb
	fll6DD/vpCKecwKQWcZoSbTCOgccG+61qaieV0V6/b81BLkevNKwlWqIrAciCO5a
	yA2Hs2RkhuERSOXAX+ZtCVFzG7+t5nj+UcjDYqJt45CEzAzisyzpCtb/bRQw8A3K
	W33c4vHRDttJPxG0JQ3p3ztQC7qLuP/p9d2bOePEMI3lTUzig5OXSm1+Sg3x5f/3
	YRnUNXNcI9AbT9BwDFdYZeKZ/fTcyBp1ccjvCBXGiexNGaqoazdSfBPfTgfM7riM
	aTLgNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuwvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:57:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso9202731cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889056; x=1792493856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSEpmU69diOtyJsEu93q34ttA2iL6Hvw0WchJvAmD5o=;
        b=dNLvTxuVuhYHFEFqVRJDKJ7wWKv3VAtJlnfCzgURFS8Jlf2/3Jbat1BcV0kC0NswFL
         SguNYY0czeZTix3ZXnOkzpceMzv4ThXqwGyBq++tMHp+qkAIL9C2fg6QhSS07HJsRdRK
         1mJXTy8XG9V+8ckIQ8kjs5SPO2tu9NP7jDMWYemum+hCt59/Hu7twHVzydL5rlsKwmZw
         jv9XCSKrsjgOVrU5bnMXLM0hAlFFoQMsianpIRbpd0lKCJPqOdQoBKpM3eTvmGLgKXXC
         C5Tz26fFADZnjiqp4aLDml7vczAIzGQkW8rGT6rqqtP2dDEkyce2K9TrFxc6Veuw8ABe
         aDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889056; x=1792493856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSEpmU69diOtyJsEu93q34ttA2iL6Hvw0WchJvAmD5o=;
        b=MboHsuscnJbELz2MeCuxrNn06NUPz1byIhdiisAHmoKxQtk0hQAVmAlUhDINKStV7t
         h3fCbl0mgVHllgECO3oCexP5sRf8LwcWFx8rTTTlyNWOf/JtcRxMGrVC986+1/ZXMhqh
         Hw4z20vLGL9zPNrjX0hR6NX38/zvyE9h+PWIWG5wxRSEIi30Tm1hnQd66hSUpdFW5oXu
         RPE9idh8k2sqNs767kYbZO8QVNl6dr8dGDIBuXNCEVgfkLReOLQ7LoWSU1Z0WH5tMtut
         3yWcKs/VKhGA7FGKfYaPYOjE3ZB/VJGmBhYcoXDyJFY6WpMZ5mqDzGCqGafTUHE/U8SO
         Czhg==
X-Forwarded-Encrypted: i=1; AKwUvBwsRgGP4nzwENMb9/GZpBF+d2MlPLXycfefy/Cvm9oAciy28DPzAZcho4Ny91SbiOrR0WkBeb4KsYzofyXe@vger.kernel.org
X-Gm-Message-State: AFq9FYIHImnaHTHZRvdHhGCrQHxL48PlHGI31GhqzNuYze5/H8TeqwZT
	ru57OF32ENwYP1PYAmt7yJG5TRZH2WDw5HV1KR0ZO37BGfWQl6OEeewbGLMMrfcRp96gXD0H9fg
	Wp8krTbFWZ8Xoqo9kdt38Z6jlABWyvHwdh4BXQ0HjcwxBxr5zFTMZmi6xB+VI7Je7aFJH
X-Gm-Gg: AYBFou0l54n3qhxAMe66zx8lLY3k/pj5RAfUCv/+4Jnmj7ED9o2v/lzGnTmzEHsVGAd
	/Vq76bIZO3Kgcq7WdnGG46poZMthcLYUwkpKtvCdEypPQHRNsnwz9Eo8bD2PS7ba/BM/rNsHwTB
	hHBIdkxa6w7iZdtY7jAC99OsmScWlWq3dk9ayT9enkpipuoNJ0wAVovd/HkpRTpoGiG5/np9W84
	h10O5q6YRfL+9Sw8FRpJuNAX4wNH+F6E7X/TMnaEWFCKrHLQH2HGnGAx+xU3x9ARu7NSciF9Vlw
	TAY41pDmY6L3phk3lbnE8D2gC20rWhztbhwaB2+WOD18NaFXjzQnFXZQPBC2oNOcrkwiUmJmQ+o
	JyejIshuFCe+VsJowDxiwKA==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr243719001cf.1.1791889056356;
        Tue, 13 Oct 2026 03:57:36 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr243718701cf.1.1791889055675;
        Tue, 13 Oct 2026 03:57:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fa559721sm67647966b.56.2026.10.13.03.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:57:34 -0700 (PDT)
Message-ID: <9067a9aa-3edc-4139-9310-977a9a8cd793@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Rob Herring <robh@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
 <20261007-glymur-dtfix-v4-2-31f7143e759b@oss.qualcomm.com>
 <20261007204549.GA234290-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007204549.GA234290-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -IC-KbO4oHx51BXRBAdOoy2m8TGyq20y
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace0ea1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXx0K0rO36VgUu
 QnUloq0b2HVgmif4uXjnAWT/m5D0KqMvPeWl6jn8DXoOxfr/nFzYmwU6c/yWvciMSEoxjfO+BAG
 LXMneeY8/qsOc+uRXA1Xg86G5sDgGRk=
X-Proofpoint-ORIG-GUID: -IC-KbO4oHx51BXRBAdOoy2m8TGyq20y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX8LZa8B+LAPGi
 tNBHZa6GlqFJXvxtYpcYdLCVsi7a2wSfrpJBFTo8MLCf6g5ZL+OMwyzBl3EONHM2QQcW7CjMIPd
 7Hr15SF4REyFwcpoWcQTSn4N3UwtZbbriKUsd+svNOZtEhn6j0CTgIkutWgFPRHdlfu1GBYFkli
 VpnmoOtb7KdR1upNFvz127ivgRhqbzbYrB6Px6GlSF8QOzmUR+nP6BVaFoxo6cOdh8cGWXwhYLj
 qmu4czyuxYBaLow+3SQE/ehFamWalZEXQHt8z7sgBUwgThhhf94CVIfctV4K65/kNYqLHHkVP/w
 om1XttZlbsdM6uslJNI20Iv6pIc/z8uoZvR2nE5085pewZVNVcn0sE/MDj+DSQqiPZ2gDAQEzX4
 AKDAZ7/y06vUS7rGlI8Elk9MbBmHQWfU2jt3q9zbuKUTKgqrlY355xssydn7KTlRuk0vWgOm/RA
 r6wGrczPmHBJfxdBvdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043

On 10/7/26 10:45 PM, Rob Herring wrote:
> On Wed, Oct 07, 2026 at 03:51:18PM +0530, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index de7c395d9c35..3219603372ce 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>>  
>>  					/* note: compute-cb@9 is secure */
>>  
>> -					compute-cb@10 {
>> +					compute-cb@c {
>>  						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <10>;
>> +						reg = <12>;
> 
> Normally, reg is written in hex too.

+1 please do that

Konrad
