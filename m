Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44003ED109;
	Mon, 27 Jul 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144503; cv=none; b=OFA/2ELPn7Zih4sJ6Opt+yOVVDRJkmBcX/XGkNfiueMlfE9zzlB6z2TZD2ajIdcwd8lrHW7y3j99bP92kxopAD3V09bxErToBsa0mOxZnesoMK3zjPTlRtPNWE8RHkkAEJooMR6MRupQSM2PGnt1DFT+7qPAXyKENDptqVXloXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144503; c=relaxed/simple;
	bh=zqMGlh3biNsnkY8MPEPBXCzTaaMKkypVYNnBhI6aoH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2f5ZB8CwXCQ+thRWNEWN5ITrvb3n+R4odAb2anBu4GJY1hvjk01jT9Xrn9Xwqbp136KZABfftdM10oTHilg4E6U8vgG+yol1JM9uvQx2oYvAGQAgS88mtf0GEhgRrAtMTX4TjMA5vyZzaADWFZkgD92sK4HHFKOV4ovqgooMPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UK2Uah9I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UK2Uah9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23091F00A3A;
	Mon, 27 Jul 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144499;
	bh=Hnbil0JU6qbMgMM6fCXvHTBMLGYsGZm9D5KDs6vjqlc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UK2Uah9IymEeYmLMIFqfRbLxoN5r4fi0/VmZi6/0EeSYWNPyHhcrhj3hGXD9PSfGI
	 cldCV2b0zcILM5VVcq8mrIha4UR7LUsHqrn5ts+PXUUtYQkFG272eyuTJwiyK4tEUA
	 ITk/tZnzzGR+CmddYxD/a6T4bL2p2IUWxLDfV2B/qjwSBJuYDxWpi7yjNSj0O2atVh
	 Oc37eH9RomM9ekQkLGaD3a6Qzodm8fubbsXsVOmB3XKUrFHngkq5b2QdBnVhbbkhV7
	 Zdx4MZzl8PVaQBhB51Kp0Lg5GrBXtq7Z8nE2bivDy2qCPM3609ZTu19eX7pa0W32XI
	 hIAqw2sAvVrKw==
Message-ID: <f5976c95-e59a-47ec-9d92-f3119a4f3e8c@kernel.org>
Date: Mon, 27 Jul 2026 10:28:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add missing <linux/bitfield.h> include
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, broonie@kernel.org, stable@kernel.org
References: <20260727050238.323039-1-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260727050238.323039-1-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/27/26 6:02 AM, Ekansh Gupta wrote:
> Commit 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with
> GENMASK") introduced uses of FIELD_GET() and FIELD_PREP() but omitted
> the header that defines them.  This causes build failures on x86_64
> allmodconfig:
> 
>   drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_GET'
>   drivers/misc/fastrpc.c: error: call to undeclared function 'FIELD_PREP'
> 
> The missing declaration also causes a secondary -Wformat error because
> the compiler treats the implicit FIELD_GET() as returning int, which
> mismatches the %llx format specifier used in the dev_dbg() call.
> 
> Fix by adding #include <linux/bitfield.h>.
> 
> Fixes: 10555ba6126ed ("misc: fastrpc: Replace hardcoded ctxid mask with GENMASK")
> Cc: stable@kernel.org

Was this reported by some test bot ? if yes, please add Reported by and
Closes tag.

--srini
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 94681394c1a0..017334ea4f34 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/bitops.h>
>  #include <linux/compiler.h>

