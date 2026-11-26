Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678827;
	b=jRAhOGBS6J4B13RKjpkztF7mY3N+L7QwiChc/LoxKs2Ll0suEt6jlNN7nndubq6IqzHA
	 VnK8awwLWiLRRI/m4cgGbmCrQfUI5YUvGimfIU1mlpMgD+/FuIf4jNOWlzB+/Piyw0LQw
	 aYi81HJD7FcDM/zzSGuD/50/wrv18SFltvY3XEUgPltMZKCfT4uaMaVmJiM6iH/vVqO6I
	 EcV93OFUaKnFoEJ6lbGn4vMqY619pC4YvnEzz/weRvBZb6FjvFJHRPVQ9ZIOeRk2qjWeU
	 y7H0wWaJcQM9LO1CadeNf/veGjUi/xUlkS7gWm1lAEgy/0kSjPTpumZS4PQxcxXc0bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
	b=oVgSxcu3uIny346AjCPminTKrqHPXDs/Xjw1Oqg1+WoFuqOT1Q67GsAcH6854RW3Cb0h
	 f8pS3Qed0Zs4yYbNBAxlg9HYRRVoorrYpX8bvghEhLQDMO3wnbqGs8nitWrzZOfOLfU8r
	 ZDW0BteJ7LScnxUy/Cgw6QNC67e6UuGYzbtvSQheROly7YpVTMX8gupSNleIbpjBONFcf
	 qMo3ee3rP9aLr4J0J72vG7hTnsEs2WBb7iVJTX+PqAUnktqWzEjZV7l5psZedlZk63Xvc
	 fEIwOfiGVDcYAkbIolVn2XtesqYfLfveX3I36NY7hBwAGUY4V2XUlh9XSxuZUTeFz8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1F606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BLs5920141
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXWlGCRC9JQkumWInitkE8i9
	IQlzJPF9vbX50igGRpE=; b=O3r9h3EosuF9La/6Gk7uOPkO4ocLiXnApEIAq0JS
	iwKgxZwIGDvt9pNdEIF4kg6QTVy+0uGoQUvInBreDTq5wxmPe4raq10qjgEDx7gw
	XRsbdE3bKZGT/zOH3xJpEzKRQZQBjwQnwI5VSPfaH3B+TNCEtOKrl0u63w8vDNGU
	SfG3Aq76yZ0r1PbEdj+aG8j5TTkpP9GuDPuHfZ23RdwzcTuSs0sY/twBfH8v2fwO
	xoaK+fDgSNB2OxS5b+AtTecoTxS88YFn2klbbOfsaBQmEc5swCkiiMztSbSLeYDR
	eeI6dTBfmkxJ2C+Dna+XftGJ3zlNETyh1RVjYs+/K0RVSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1yu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:40:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so5784633eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678826; x=1796283626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=HbhqQaTtUpIVHEYSZ/lBnCTkaiQmQU9BVp4ByHYxoHK7iB5Se6gMVgigWKa2RsKXqp
         ajWpl3lojcKhFfRrNdMSIaE0yEUrjhOf/WPSaumhIs4RtgsFoYRD8y2GdrwZc5Yd7jFF
         4R4V684rPRqQzBf6sGySOFgQMKWEVK3FBMC90QVU4ITpgNzxcaNrn5eU9lxcouzo9iYW
         ok/Pc5mKmuY/sx+3IjOcON6exSgQkxe9W07ldnmYwx0qmR1UwrZ+o2yurcZOTRxeiACf
         v/9M4YPVAQTwOKp0jFeuPYPxoK+oHHi0XNFRDtaBF+3f42hXUFmUuNPKQtZdYj/YH6xb
         pQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678826; x=1796283626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=H+r0SX7ygAXGeFGxiSdVXWvdB+p/cxMj7VBcTmkeHPd1+zPYVbhBtb+PdylJfNA2Bb
         ajtu7BOEU5IcKKI6daMHED+lDqLQhbXjZd/QhUrSD18JakssTOPmLeL5wYDwahBUqK0F
         aoDYbI6iohCgJIlJYbyYwzqdipCjkydGgFAN3Oo9Vd9G1VeGCAdjOQNs7i4Nc6KA2UKB
         Zocuqfb4t77W/OTMBAqgV4Z9a0/806g20/mkvxgFVewp+TasykKudMN4zn0KslJE3+nc
         jfCReMeoYqwdtYVphms98o826UoOqxGhilOu02nKs+kRgLGR47iTt1pxNAP1uyQPdvJM
         u4jg==
X-Forwarded-Encrypted: i=1; AL+hErFMjm72taxmDK05wW2YliyUdx4FsB0qD1+9ddqVjFGRI8eS8rmP3MzIFPXj7VsfnyrkEX0HSG6D1ozYMCor@vger.kernel.org
X-Gm-Message-State: APuU4Z/VcwIUZO/EszYhs8k9tvSqVpLk1W+nl6gewA/Iqqv1VzO2T4WB
	Xc3cpb/mVQr7TiXM47WwtGe61WgtEdgoh8hFtf53WBdU1lXQ+yTdjhHW1sIwSW1ELKYkv89m6B9
	dObvZf8F0TIalWOp6LWlAnfCSNkbzf90K+U5zNp94zOri5gqi5MiavsDkStvt4f9jhnbV
X-Gm-Gg: AZFdTZe8uuY4rMqKssfs8uYFqLckM5d5lNWh1+1cJ7fzxkxugUPltf2QnhXPq913jVQ
	E8e/vZhEFb/Yy5H/iIujDN0FZVXGhoTiteU+38d+Kx6AkcGMTkqzUMGvsE4Mr3nFslD4LQzrLt3
	DroU7bcrQUhmLzg+SlJxC+7KdgHVHwm/WP+ifu5tAV9hKWoFs7EMSLR01zWP3aiLU+tS9rPJatR
	MURRMgzfCn+GvxxoKOI9gQByFP+ryu65eJNJ+r0QrLQoyyTYOHbVsbc/QLKl1XfIDE2MUUy8ufb
	ltKj7ZjH0JlVW8fXuZ2iwM9oCxTIbB0UzkyFiJbDjdCGAOxT/mXaHuHHFI1Ix6uwQcWEL/Tm73Y
	PwErB5E3TIqda63NKHYuuFRlqk1J/dwdmaULPaz969g5L8OT4504ygZTTyCo+03b9lk9j4lCvgb
	MZbwqsMBs2CNLA1/uSI8Awids=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18107020eec.40.1795678825946;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18106995eec.40.1795678825418;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm47180909eec.1.2026.11.25.23.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Date: Wed, 25 Nov 2026 23:40:23 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
Message-ID: <awfiZ8IE4UMuiO7P@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXwe5cGpJvJS2F
 LiNxhzb2MmB6ruElfXXT6yMoKP4WdpfjdnnEa1t2SZfKX77Vznf02vq2j+EL7tuwdidRXv2twPv
 oc8NbHvdJFzt4r0AUeXvztAPQNHp2glzMENk8UXphQ+SnNfxpf3drh881jBKEayHaMnI5MkCHWf
 Mb5aORwA0TKvcyxDB8uVj1w7Skt0Iu0UHzclGU7a1i/INVheTAn04Ks4qmnJ/vA5Ke4ozySNIiN
 iBRy638vGmY8e98PN7y+enPbZ0/mdBMaIf1pqR/radzM8TBTzb5ANh3k/sWKzAbdU1QakhsoL7j
 QzjEcrpGB6fiPXyZYW4OO3WI1qPoaHvfxFX91Ih6ufr/D/EScNnXe4X3FmfmkBg0NPtplWMJLtD
 HmeHEVh6z2db7eLVXiX0KxLt77Slq5x6++ciRBE6Nc1SXUFUdNnDf7A7Yi0uTSTrFXoPDEefnci
 bJEs5eKZsG7qTMoIICw==
X-Proofpoint-GUID: 62Qgbc3a3mUVk5aRvsbIMKoP0BqTIV-_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX7dXzvG56lJ7j
 qgqff+Eo3mRytFyThCAfO0TE3z7viK+s24gTMuKcIdV81A0/7PcFaZ373BnsHf3Hef8yhu/c+x8
 rdzB/xYMe/4iugI5nkPyJrSTzx+Zq4I=
X-Proofpoint-ORIG-GUID: 62Qgbc3a3mUVk5aRvsbIMKoP0BqTIV-_
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07e26a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=Y18rF2VYFuf4IdEaWfYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:16, Faisal Hassan wrote:
> The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
> handle both system PM and runtime PM paths but cannot
> differentiate between them, preventing distinct power
> management strategies.
> 
> Refactor suspend/resume functions to accept pm_message_t
> instead of boolean wakeup flags. Use PMSG_IS_AUTO()
> to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
> system PM (PMSG_SUSPEND/RESUME) paths.
> 
> Preserve existing wakeup behavior: always enable wakeup
> for runtime suspend, check device_may_wakeup() for system
> suspend.
> 
> Follow dwc3/core.c pattern to enable future per-path
> strategies like differentiated power states.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d44f093ac243..7a7225b900b3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +/*
> + * For runtime PM, always enable wakeup.
> + * For system PM, check device wakeup capability.
> + */
> +static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
> +{
> +	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
> +}
> +
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	u32 val;
>  	int i, ret;
>  
> @@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	int ret;
>  	int i;
>  
> @@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
>  	ret = dwc3_pm_suspend(&qcom->dwc);
>  	if (ret)
>  		return ret;
>  
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>  
> @@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
>  	if (ret)
>  		return ret;
>  
> @@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
>  }
>  
>  static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
