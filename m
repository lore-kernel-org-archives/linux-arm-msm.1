Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619074772BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249350; cv=none; b=kfqyHwKmSK7BzeuY9sWZE/rFArsNvGtiK1Y0TcKpjd0XifG50YGgCizArv2Fktj5LWNa2c5RhqxBfiWawlG9d2qeRVXWA92dxaCdVhH7Pmrn8T6Y1p5kQ9B19Lr9Cv7tK2fnfNgu4mV62nE0MVep+nOTxmv64/EGaIvYKVym1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249350; c=relaxed/simple;
	bh=901dGwwGWeM97UvSCfaUjJ+Jy7KFMI5sFO3aLsz983A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw+jxYLwoL4WXEkDHvNw2myyYveRIeeIAU0HR/YVCbx1sB3N9hTG0f62gi+YUpOD0o76hFb9Rr5sY/25bRWrMMu7+GDbWnxzAoJ8h7DJuAaRrkuNGHh9UWNIinZgC/rBDyQJcH2R9+zqmEvXi11xbjqMjccE/gRAMyUxT1Trv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUyc8jwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky7MsPN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUyc8jwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky7MsPN+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3JkU2483612
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qH3AKWtb08ijvgAHQk4wbGp4
	z6QD8iNHR70hZb76a84=; b=aUyc8jwnNSxsy4ttNv/BvcM+/y3GZChoEOcKi7IU
	WJERRgVVwIKYeeesS3SeVKQm2oiYnPmr+bYHVoTKg+zm+ahHP2+87E/Bv9dM/9ce
	ZuS0whcwgpr5PPXMb5iu3NwGIPsbRRvgWIYKq/N7nX5rD2Vn7km+IgntA5rGJfpN
	HgGJiwzRk9cFlzQgbtW2zmpj5uDTy3s/lmfibGaUHeWkSO4S+7oS888ZLb2pnFmU
	PukERyD/bX36JlUi45zJRZrW4YjJpboWc180IaSmsNOAFS3yWcK9njMJrfdpgES+
	LsDMA5ypStW648s3YkkrF78nOPiMP8mPJxA/m1xhkQnNzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90a3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:29:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be1861d2dso293835785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249342; x=1790854142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qH3AKWtb08ijvgAHQk4wbGp4z6QD8iNHR70hZb76a84=;
        b=Ky7MsPN+K+yURLhY14GrtBSFfVAij0yCEQOqbcuaknBdJnyKil+ORtqjJBv99PfA9j
         S9YnQgP1Rfav89/nA+RlcVPCL51YBNOOOBB8kyl3+toKOilQcGeZt1epqgWW1JqvgI9z
         DTtdreLohelNCNgztmPvwTVtZ+ulAnxB5bfLgHZucZeawHvIKK/gCrSRqYSKLP8jra1L
         75Yh7DS6WFjtfKiWPduK/QgJQePA4pxyQNyitNg2I1BIhB3wlcRX13NQIyoPC+hk8ZNL
         Ff25Rb6xuf8ANjZKatBqFdz+cWO50ptl2tlOPSATneekOlkLrNc6al5upSCvSPwXS0jo
         k3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249342; x=1790854142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qH3AKWtb08ijvgAHQk4wbGp4z6QD8iNHR70hZb76a84=;
        b=m0CAl0tMfrZpIkMJwVOzSny7ot+qhsaABrtxrCyaDfjbO0cBueBqo/r4usuBtCpeV6
         qKgotifC2q5fSOwjFjsxQr/ZPvVn5HFM2+utSZTCeJKn2ZUfthdAkAmlL8RWC0iilpM/
         nwX304ZaFCGzdTCfQwS15oZ50Lgou3yU54DDdTz5hnCzAYqcf48cIlxnwmz0RA+QL3Cy
         rnt+YX1Ql7AF5ySm5XwUsoGE6xzhYPZ/y3VmUa0YCH3eucZu2Z+DscNCo54y036CceLF
         7PQUTb3aU8HSFoTZ2AhpgYXbDnoUXKPqQSPpJV3mmmGuh5s/MSxskAr2WbyE4k/d7exF
         LySw==
X-Forwarded-Encrypted: i=1; AKwUvBxJSyNnyeoJ5DvU/VxTP61eXDHmSbdWAbsf488l6j+No/G7PzW5doUuzozgquGzKXZgCDJNfI8zm9u/EhfP@vger.kernel.org
X-Gm-Message-State: AFuF++lhFkP8NIx97rgF2UhTt5kWZMQih75g4NOTGzzT/uyTz+9XkdQ7
	TFYXWWy+/+aL9fhldhyGHNdHjVSMzTWToGSHC0yHtnxGzDUDHtra1S6J9pPLkgJbrPGeQXYavAo
	p8KKClngvymcT/a+wqL0HzMRKMwTXnneAtAXJ0UbWK+WzYt4DTFudqrV9HztBSc6WgrWz
X-Gm-Gg: AYBFou0924wRZAYlih9RN2011XlWr9QTGnbK32SgzVbWdOsT8UU/TZcYWktzTpqP5Ta
	IW/HS7x9/5q9wSWtyg4XYwae/maGfMy2xJ5aA3RLbmUUAYy1afgOwDDYyRwz06Izi4How8dDAmn
	2c5JnA5q0EqAVMT0kixTrtLqgsXnsgb5fjquYgXWM+QNWI7YEmx0adremXDnc3lRd94a2o6kVvd
	4LRAMv+IQ88hZ8ejvpqihefjO/FRriP2PA+LjLtKPqjj5UtVorhz/ydfrTbjjH2lSQGM1nvBDeH
	tdP/VtEecuUcCDC75B8/SUMLapQ9+QYH/VxO0qIVXAfSG5vw05NBeGvDRtCxJE8/ZD9FFb2fQ5s
	EkulqJ3arY18ppRc=
X-Received: by 2002:a05:620a:19a6:b0:93a:1b82:495a with SMTP id af79cd13be357-93c36385bf4mr232409285a.37.1790249342161;
        Thu, 24 Sep 2026 04:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:93a:1b82:495a with SMTP id af79cd13be357-93c36385bf4mr232403085a.37.1790249341556;
        Thu, 24 Sep 2026 04:29:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm106427115e9.3.2026.09.24.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:29:00 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:28:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add LLCC node
Message-ID: <6pj4rxeansgpqilivwjtugq4mrnfhufxa47fa3ovopxizcz5gf@pvm43wfiqtmo>
References: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX3cozFNNg2Bg9
 6AxY9eHpzAFrwFidvH9MV2cc2Tt0ZkTto3HbqfXklggAZAUhH1Mzy9Xs3ntNSe8r7oGaG9rubGY
 VuM3fnJX+vv0MnulbOuCd3lwHW6ODwGbugMd1V3nxLwFFNvLmP9WSrHD3tlNsavWCJrG+15l6mO
 QW68DWPsTHzfuJenjcpMz637FFyBXIWyP/lPVsmqvpb7FhtjR2QUSigj3NjnnPG1nLTjLjeP3Gw
 txPi1l4VjbFGC3uSUIxHU5FN/kTRA7nMylycKM6PA/xjq8qjxUBUCrdRXdK8IUo3/fcdF6Pd2VB
 +URbVXMbNQRvgRXoQelhGa3BhkYREqa+dQoiD/BALFcY9JoBdN0vrO+gJ/mfV5kA3IPQXHWDmNV
 AaiXemCd7nTgi4/l2cvryUUalZ+2+2uCMyF9j4jqWpLJt1BxCwKvJWJv/iM+TrzWVoutNrcbB30
 qXb6r6z/m8qQBtwcJxw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab5097e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zdnQAcmOsowbSLqG7IQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX8f5Vc0u448ZN
 DRGP+8qTOXNdInkSXNUJPDZrUmjJoBAegGsjfQxWaZrYg+RcCdosiq9xOg5Xq1tgV9CT/qv/4X6
 0wdl+aAO5Ub/6IbgxkIYGSdjvNfM1Kg=
X-Proofpoint-ORIG-GUID: 6kpmU2lxB4VwFBZ3c6AaS7N7oPYMwQIV
X-Proofpoint-GUID: 6kpmU2lxB4VwFBZ3c6AaS7N7oPYMwQIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240047

On 26-09-22 17:17:35, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the system cache controller. All sixteen banks are listed, four per
> DDR slice at 0x100000 strides from slice + 0x800000, followed by the
> global broadcast OR/AND regions, which the driver expects at the reg
> indices right after the last bank.
> 
> No ECC interrupt is described, as the Nord interrupt map does not expose
> one for the LLCC. The driver treats it as optional.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
